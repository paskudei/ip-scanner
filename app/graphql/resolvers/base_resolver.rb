# frozen_string_literal: true

module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    private

    def raise_unprocessable_entity!(messages: {}, full_messages: [])
      raise GraphQL::ExecutionError.new(
        'Unprocessable Entity',
        extensions: {
          type: 'UNPROCESSABLE_ENTITY',
          messages: messages,
          fullMessages: full_messages
        }
      )
    end
  end
end
