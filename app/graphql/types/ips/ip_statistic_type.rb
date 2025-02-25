# frozen_string_literal: true

module Types
  module Ips
    class IpStatisticType < Types::Ips::IpType
      graphql_name 'IpStatistic'

      field :statistic,
            ::Types::Ips::IpStatistics::RttType,
            description: 'Статистика для IP адреса',
            null: false
    end
  end
end
