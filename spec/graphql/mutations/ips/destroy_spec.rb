# frozen_string_literal: true

describe Mutations::Ips::Destroy do
  subject { query_execution }

  include_context 'with graphql query execution', with_input_variables: true

  let!(:ip) { create(:ip) }
  let(:input) { { id: ip.id } }

  let(:query) do
    <<-GRAPHQL
      mutation destroyIp($input: DestroyIp!) {
        mutation: destroyIp(input: $input) {
          id
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
        '__typename' => 'Ip'
      }
    end

    it { is_expected.to eq(expected_result) }
    it { expect { query_execution }.to change(Ip, :count).by(-1) }
  end
end
