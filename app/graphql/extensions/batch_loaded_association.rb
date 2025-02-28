# frozen_string_literal: true

module Extensions
  class BatchLoadedAssociation < GraphQL::Schema::FieldExtension
    def resolve(object:, **_rest)
      klass = object.object.class
      association = field.method_sym

      if object.object.association(association).loaded?
        object.object.send(association)
      else
        ::Loaders::AssociationLoader.for(klass, association).load(object.object)
      end
    end
  end
end
