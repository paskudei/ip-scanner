# frozen_string_literal: true

module Resolvers
  class AbstractScopableResolver < BaseResolver
    include ::GraphqlUtilityHelpers

    def resolve(args = {})
      find(scope, args[:id])
    end

    private

    def scope
      model.all
    end

    def model
      raise 'model is required'
    end

    def underscore_type
      'query'
    end

    def underscore_field
      field.graphql_name.underscore.to_s
    end
  end
end
