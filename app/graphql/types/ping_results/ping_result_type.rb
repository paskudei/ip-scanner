# frozen_string_literal: true

module Types
  module PingResults
    class PingResultType < Types::ActiveRecordBasedType
      graphql_name 'PingResult'

      field :rtt,
            Float,
            description: I18n.t('graphql.description.ping_result.rtt'),
            null: true
    end
  end
end
