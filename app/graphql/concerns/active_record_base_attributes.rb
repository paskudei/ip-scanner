# frozen_string_literal: true

module ActiveRecordBaseAttributes
  extend ActiveSupport::Concern

  included do
    field :id,
          ::GraphQL::Types::ID,
          description: I18n.t('graphql.id'),
          null: true

    field :created_at,
          ::GraphQL::Types::ISO8601DateTime,
          description: I18n.t('graphql.created_at'),
          null: true

    field :updated_at,
          ::GraphQL::Types::ISO8601DateTime,
          description: I18n.t('graphql.updated_at'),
          null: true
  end
end
