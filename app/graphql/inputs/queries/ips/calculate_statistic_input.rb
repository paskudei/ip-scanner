# frozen_string_literal: true

module Inputs
  module Queries
    module Ips
      class CalculateStatisticInput < ::Types::BaseInputObject
        graphql_name 'CalculateStatisticInput'

        argument :id,
                 ::GraphQL::Types::ID,
                 description: I18n.t('graphql.description.id'),
                 required: true

        argument :time_from,
                 GraphQL::Types::ISO8601DateTime,
                 description: I18n.t('graphql.description.ip.statistics.time_to'),
                 required: true

        argument :time_to,
                 GraphQL::Types::ISO8601DateTime,
                 description: I18n.t('graphql.description.ip.statistics.time_from'),
                 required: true
      end
    end
  end
end
