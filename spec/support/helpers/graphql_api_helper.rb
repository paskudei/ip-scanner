# frozen_string_literal: true

def execute_api_query(query, variables: {}, context: {})
  ServersSchema
    .execute(
      query,
      variables:,
      context:,
      operation_name: nil
    ).to_h.with_indifferent_access
end
