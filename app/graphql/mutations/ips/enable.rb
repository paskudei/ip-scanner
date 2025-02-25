# frozen_string_literal: true

module Mutations
  module Ips
    class Enable < Mutations::BaseMutation
      description 'Включить сбор статистики IP'

      type ::Types::Ips::IpType

      argument :input,
               ::Inputs::Mutations::Ips::EnableInput,
               required: true

      def resolve(input:)
        find(Ip, input[:id]).tap do |ip|
          return ip if ip.enabled?

          result = ::Ips::EnableService.call(ip:)
          ::Ips::MonitoringJob.perform_async(ip.id) if result
        end
      end
    end
  end
end
