# frozen_string_literal: true

module Types
  module Ips
    module IpStatistics
      class RttType < Types::BaseObject
        graphql_name 'RttType'

        field :avg_rtt,
              Float,
              description: I18n.t('graphql.description.ip.statistics.avg_rtt'),
              null: true

        field :min_rtt,
              Float,
              description: I18n.t('graphql.description.ip.statistics.min_rtt'),
              null: true

        field :max_rtt,
              Float,
              description: I18n.t('graphql.description.ip.statistics.max_rtt'),
              null: true

        field :median_rtt,
              Float,
              description: I18n.t('graphql.description.ip.statistics.median_rtt'),
              null: true

        field :std_dev,
              Float,
              description: I18n.t('graphql.description.ip.statistics.std_dev'),
              null: true

        field :packet_loss,
              Float,
              description: I18n.t('graphql.description.ip.statistics.packet_loss'),
              null: false
      end
    end
  end
end
