# frozen_string_literal: true

module Mutations
  module Ips
    module Index
      extend ActiveSupport::Concern

      included do
        field :destroy_ip,
              mutation: ::Mutations::Ips::Destroy

        field :disable_ip,
              mutation: ::Mutations::Ips::Disable

        field :enable_ip,
              mutation: ::Mutations::Ips::Enable

        field :create_ip,
              mutation: Mutations::Ips::Create
      end
    end
  end
end
