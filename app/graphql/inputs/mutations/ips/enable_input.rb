# frozen_string_literal: true

module Inputs
  module Mutations
    module Ips
      class EnableInput < ::Types::BaseInputObject
        graphql_name 'EnableIp'

        argument :id,
                 ID,
                 required: true
      end
    end
  end
end
