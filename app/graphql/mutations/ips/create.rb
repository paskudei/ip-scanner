# frozen_string_literal: true

module Mutations
  module Ips
    class Create < Mutations::CreateActiveRecordObject
      type ::Types::Ips::IpType

      argument :input,
               ::Inputs::Mutations::Ips::CreateInput,
               required: true

      private

      def object_class
        ::Ip
      end

      def after_success_create_hook(object)
        ::Ips::MonitoringJob.perform_async(object.id)
      end
    end
  end
end
