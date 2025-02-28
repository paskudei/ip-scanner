# frozen_string_literal: true

module Mutations
  module Ips
    class Disable < Mutations::BaseMutation
      type ::Types::Ips::IpType

      argument :input,
               ::Inputs::Mutations::Ips::DisableInput,
               description: I18n.t('graphql.description.input'),
               required: true

      def resolve(input:)
        find(Ip, input[:id]).tap do |ip|
          ::Ips::DisableService.call(ip:)
        end
      end
    end
  end
end
