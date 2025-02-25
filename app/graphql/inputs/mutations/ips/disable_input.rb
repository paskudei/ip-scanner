# frozen_string_literal: true

module Inputs
  module Mutations
    module Ips
      class DisableInput < ::Types::BaseInputObject
        graphql_name 'DisableIp'

        argument :id,
                 ID,
                 required: true
      end
    end
  end
end
