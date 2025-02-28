# frozen_string_literal: true

module Inputs
  module Mutations
    module Ips
      class DisableInput < ::Types::BaseInputObject
        graphql_name 'DisableIp'

        argument :id,
                 ID,
                 description: I18n.t('graphql.description.id'),
                 required: true
      end
    end
  end
end
