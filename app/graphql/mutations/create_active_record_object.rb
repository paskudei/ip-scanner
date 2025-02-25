# frozen_string_literal: true

module Mutations
  class CreateActiveRecordObject < Mutations::BaseMutation
    null false

    def resolve(input:)
      @input = input
      resolve_initializer(input)

      if successful_operation?
        after_success_create_hook(instance)
        successful_response
      else
        after_failure_create_hook(instance)
        raise_unsuccessful_response!
      end
    end

    private

    attr_reader :input

    def resolve_initializer(input)
      @object = object_class.new(params(input))
    end

    def raise_unsuccessful_response!
      raise_unprocessable_model!(unsuccessful_response)
    end

    def successful_operation?
      @object.save
    end

    def instance
      @object
    end

    def successful_response
      @object.reload
    end

    def unsuccessful_response
      instance
    end

    def params(_input)
      default_attributes
        .deep_transform_keys(&:to_s)
        .deep_merge(provided_attributes)
        .deep_merge(override_attributes.deep_transform_keys(&:to_s))
    end

    def object_class
      raise NotImplementedError, 'Object class is required'
    end

    def default_attributes
      {}
    end

    def override_attributes
      {}
    end

    def provided_attributes
      input
        .to_h
        .deep_transform_keys { |key| key.to_s.underscore }
    end

    def after_success_create_hook(_); end

    def after_failure_create_hook(_); end
  end
end
