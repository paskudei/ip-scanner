# frozen_string_literal: true

module Inputs
  module Mutations
    module Ips
      class CreateInput < ::Types::BaseInputObject
        graphql_name 'CreateIp'

        argument :address,
                 String,
                 required: true

        argument :enabled,
                 Boolean,
                 required: true
      end
    end
  end
end
