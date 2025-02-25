# frozen_string_literal: true

module Inputs
  module Queries
    module Ips
      class CalculateStatisticInput < ::Types::BaseInputObject
        graphql_name 'CalculateStatisticInput'

        argument :id,
                 ::GraphQL::Types::ID,
                 required: true

        argument :time_from,
                 GraphQL::Types::ISO8601DateTime,
                 required: true

        argument :time_to,
                 GraphQL::Types::ISO8601DateTime,
                 required: true
      end
    end
  end
end
