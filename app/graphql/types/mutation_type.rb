# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    graphql_name 'Mutation'

    include Mutations::Ips::Index
  end
end
