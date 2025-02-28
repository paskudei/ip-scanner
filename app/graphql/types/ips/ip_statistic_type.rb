# frozen_string_literal: true

module Types
  module Ips
    class IpStatisticType < Types::Ips::IpType
      graphql_name 'IpStatistic'

      field :statistic,
            ::Types::Ips::IpStatistics::RttType,
            description: I18n.t('graphql.description.ip.statistic'),
            null: false
    end
  end
end
