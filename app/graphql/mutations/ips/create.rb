# frozen_string_literal: true

module Mutations
  module Ips
    class Create < Mutations::CreateActiveRecordObject
      type ::Types::Ips::IpType

      argument :input,
               ::Inputs::Mutations::Ips::CreateInput,
               description: I18n.t('graphql.description.input'),
               required: true

      private

      def object_class
        ::Ip
      end

      def after_success_create_hook(object)
        ::Ips::MonitoringJob.perform_async(object.id) if object.enabled?
      end
    end
  end
end
