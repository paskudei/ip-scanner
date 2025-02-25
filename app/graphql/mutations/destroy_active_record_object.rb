# frozen_string_literal: true

module Mutations
  class DestroyActiveRecordObject < Mutations::BaseMutation
    null false

    def resolve(params)
      scope.find(id(params)).tap(&:destroy!)
    rescue ::ActiveRecord::RecordNotDestroyed
      raise_unprocessable_message!(
        ::I18n.t(
          'activerecord.errors.messages.unable_to_destroy_record_with_dependencies'
        )
      )
    end

    private

    def id(params)
      params[:input][:id]
    end

    def object_class
      raise NotImplementedError, 'Object class is required'
    end

    def scope
      object_class.all
    end
  end
end
