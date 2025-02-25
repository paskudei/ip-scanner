# frozen_string_literal: true

module Types
  module Ips
    class IpType < Types::ActiveRecordBasedType
      graphql_name 'Ip'

      field :address,
            String,
            description: 'IPv4 / IPv6 address',
            null: false

      field :enabled,
            Boolean,
            description: 'Сбор статистики включен?',
            null: false
    end
  end
end
