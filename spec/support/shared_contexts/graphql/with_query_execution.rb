# frozen_string_literal: true

shared_context 'with graphql query execution' do |options = {}|
  let(:query_execution) do
    execute_api_query(
      query,
      variables: variables
    )
  end

  let(:response_error_details) do
    query_execution['errors']&.first&.dig('extensions')
  end

  let(:response_validation_errors) do
    query_execution['errors']&.first&.dig('extensions', 'messages')
  end

  let(:response_validation_messages) do
    query_execution['errors']&.first&.dig('extensions', 'fullMessages')
  end

  if options[:with_input_variables]
    let(:variables) { { input: input } }
    let(:input) { {} }
  else
    let(:variables) { {} }
  end
end
