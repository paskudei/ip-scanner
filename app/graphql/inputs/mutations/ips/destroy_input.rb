# frozen_string_literal: true

module Inputs
  module Mutations
    module Ips
      class DestroyInput < ::Types::BaseInputObject
        graphql_name 'DestroyIp'

        argument :id,
                 ID,
                 required: true
      end
    end
  end
end
