# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include ::GraphqlUtilityHelpers

    private

    def raise_unprocessable_message!(*messages)
      messages = Array(messages.flatten)

      raise_unprocessable_entity!(
        messages: { base: messages },
        full_messages: messages
      )
    end

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

    def raise_unprocessable_model!(model)
      raise_unprocessable_entity!(
        messages: model.errors.messages,
        full_messages: model.errors.full_messages
      )
    end
  end
end
