# frozen_string_literal: true

module ActiveRecordBaseAttributes
  extend ActiveSupport::Concern

  included do
    field :id,
          ::GraphQL::Types::ID,
          null: true

    field :created_at,
          ::GraphQL::Types::ISO8601DateTime,
          null: true

    field :updated_at,
          ::GraphQL::Types::ISO8601DateTime,
          null: true
  end
end
