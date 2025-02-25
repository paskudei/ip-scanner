# frozen_string_literal: true

module Types
  class IpType < Types::BaseObject
    field :id, ID, null: false
    field :address, String, null: false
    field :enable, Boolean, null: false
  end
end
