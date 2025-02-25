# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    graphql_name 'Query'

    include Resolvers::Ips::Index
  end
end
