# frozen_string_literal: true

module Mutations
  module Ips
    class Disable < Mutations::BaseMutation
      description 'Выключить сбор статистики IP'

      type ::Types::Ips::IpType

      argument :input,
               ::Inputs::Mutations::Ips::DisableInput,
               required: true

      def resolve(input:)
        find(Ip, input[:id]).tap do |ip|
          ::Ips::DisableService.call(ip:)
        end
      end
    end
  end
end
