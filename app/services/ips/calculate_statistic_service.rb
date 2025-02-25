# frozen_string_literal: true

module Ips
  class CalculateStatisticService
    include Callable

    attr_reader :ip, :time_from, :time_to

    def initialize(ip:, time_from:, time_to:)
      @ip = ip
      @time_from = time_from
      @time_to = time_to
    end

    def call
      statistic
    end

    private

    class NoDataError < StandardError; end

    def sql_query
      <<-SQL.squish
        WITH filtered_checks AS (
            SELECT
                rtt
            FROM
                ping_results
            WHERE
                ip_id = :ip_id
                AND created_at BETWEEN :time_from AND :time_to
        ),
        statistic AS (
            SELECT
                COUNT(*) AS total_checks,
                COUNT(*) FILTER (WHERE rtt IS NULL) AS lost_packets,
                AVG(rtt) AS avg_rtt,
                MIN(rtt) AS min_rtt,
                MAX(rtt) AS max_rtt,
                PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY rtt) AS median_rtt,
                STDDEV(rtt) AS std_dev
            FROM
                filtered_checks
        )
        SELECT
            total_checks,
            avg_rtt,
            min_rtt,
            max_rtt,
            median_rtt,
            std_dev,
            CASE
                WHEN total_checks = 0 THEN 0
                ELSE (lost_packets::FLOAT / total_checks) * 100
    END AS packet_loss
        FROM
            statistic;
      SQL
    end

    def sanitized_sql_array
      [
        sql_query,
        {
          ip_id: ip.id,
          time_from: time_from,
          time_to: time_to
        }
      ]
    end

    def sql_query_result
      ActiveRecord::Base.connection.execute(
        ActiveRecord::Base.send(
          :sanitize_sql_array,
          sanitized_sql_array
        )
      ).first
    end

    def statistic
      Struct.new(
        :total_checks,
        :avg_rtt,
        :min_rtt,
        :max_rtt,
        :median_rtt,
        :std_dev,
        :packet_loss
      ).new(*sql_query_result.values)
    end
  end
end
