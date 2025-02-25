# frozen_string_literal: true

module Types
  class ActiveRecordBasedType < Types::BaseObject
    include ::ActiveRecordBaseAttributes
  end
end
