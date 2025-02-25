# frozen_string_literal: true

describe Mutations::Ips::Create do
  subject { query_execution }

  include_context 'with graphql query execution', with_input_variables: true

  let(:input) { { address: '77.88.9.10', enabled: false } }

  let(:query) do
    <<-GRAPHQL
      mutation createIp($input: CreateIp!) {
        mutation: createIp(input: $input) {
          id
          address
          enabled
          __typename
        }
      }
    GRAPHQL
  end

  context 'with a happy path' do
    subject { query_execution.dig('data', 'mutation') }

    let(:ip) { Ip.last }
    let(:expected_result) do
      {
        'id' => ip.id.to_s,
        'address' => ip.address.to_s,
        'enabled' => ip.enabled,
        '__typename' => 'Ip'
      }
    end

    it { is_expected.to eq(expected_result) }
    it { expect { query_execution }.to change(Ip, :count).by(1) }
  end
end
