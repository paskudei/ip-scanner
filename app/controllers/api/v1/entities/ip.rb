# frozen_string_literal: true

module API
  module V1
    module Entities
      class Ip < Grape::Entity
        expose :id
        expose :address
        expose :enabled
      end
    end
  end
end
