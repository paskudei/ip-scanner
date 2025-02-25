# frozen_string_literal: true

module Mutations
  module Ips
    class Destroy < Mutations::DestroyActiveRecordObject
      type ::Types::Ips::IpType

      argument :input,
               ::Inputs::Mutations::Ips::DestroyInput,
               required: true

      private

      def object_class
        ::Ip
      end
    end
  end
end
