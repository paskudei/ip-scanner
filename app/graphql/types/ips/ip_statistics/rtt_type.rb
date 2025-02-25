# frozen_string_literal: true

module Types
  module Ips
    module IpStatistics
      class RttType < Types::BaseObject
        graphql_name 'RttType'

        field :avg_rtt,
              Float,
              description: 'Среднее RTT (время отклика)',
              null: true

        field :min_rtt,
              Float,
              description: 'Минимальное RTT (время отклика)',
              null: true

        field :max_rtt,
              Float,
              description: 'Максимальное RTT (время отклика)',
              null: true

        field :median_rtt,
              Float,
              description: 'Медианное RTT (время отклика)',
              null: true

        field :std_dev,
              Float,
              description: 'Среднеквадратичное отклонение замеров RTT (время отклика)',
              null: true

        field :packet_loss,
              Float,
              description: 'Процент потерянных пакетов ICMP до указанного адреса',
              null: false
      end
    end
  end
end
