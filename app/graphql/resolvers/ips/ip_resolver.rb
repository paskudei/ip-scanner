# frozen_string_literal: true

module Resolvers
  module Ips
    class IpResolver < AbstractScopableResolver
      type ::Types::Ips::IpType, null: true

      argument :id,
               ::GraphQL::Types::ID,
               description: I18n.t('graphql.description.id'),
               required: true

      private

      def model
        ::Ip
      end
    end
  end
end
