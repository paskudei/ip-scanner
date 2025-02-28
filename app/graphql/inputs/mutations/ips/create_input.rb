# frozen_string_literal: true

module Inputs
  module Mutations
    module Ips
      class CreateInput < ::Types::BaseInputObject
        graphql_name 'CreateIp'

        argument :address,
                 String,
                 description: I18n.t('graphql.description.ip.address'),
                 required: true

        argument :enabled,
                 Boolean,
                 description: I18n.t('graphql.description.ip.address'),
                 required: true
      end
    end
  end
end
