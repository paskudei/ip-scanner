# frozen_string_literal: true

describe Mutations::Ips::Disable do
  subject { query_execution }

  include_context 'with graphql query execution', with_input_variables: true

  let!(:ip) { create(:ip, enabled: true) }
  let(:input) { { id: ip.id } }

  let(:query) do
    <<-GRAPHQL
      mutation disableIp($input: DisableIp!) {
        mutation: disableIp(input: $input) {
          id
          enabled
          __typename
        }
      }
    GRAPHQL
  end

  context 'with a happy path' do
    subject { query_execution.dig('data', 'mutation') }

    let(:expected_result) do
      {
        'id' => ip.id.to_s,
        'enabled' => false,
        '__typename' => 'Ip'
      }
    end

    it { is_expected.to eq(expected_result) }
  end
end
