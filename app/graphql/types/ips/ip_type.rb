# frozen_string_literal: true

module Types
  module Ips
    class IpType < Types::ActiveRecordBasedType
      graphql_name 'Ip'

      field :address,
            String,
            description: I18n.t('graphql.description.ip.address'),
            null: false

      field :enabled,
            Boolean,
            description: I18n.t('graphql.description.ip.enabled'),
            null: false

      field :ping_results,
            [::Types::PingResults::PingResultType],
            description: I18n.t('graphql.description.ip.ping_results'),
            extensions: [::Extensions::BatchLoadedAssociation],
            null: false
    end
  end
end
