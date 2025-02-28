# frozen_string_literal: true

describe Resolvers::Ips::IpResolver do
  include_context 'with graphql query execution'

  let(:query) do
    <<-GRAPHQL
      query Ip($id: ID!) {
        ip(id: $id) {
          id
          address
          enabled
          createdAt
          updatedAt
          pingResults {
            id
            rtt
            createdAt
            updatedAt
            __typename
          }
          __typename
        }
      }
    GRAPHQL
  end

  context 'with success result' do
    subject { query_execution.dig('data', 'ip') }

    let!(:ip) { create(:ip) }
    let!(:ping_result) { create(:ping_result, ip:) }

    let(:variables) { { id: ip.id } }
    let(:expected_result) do
      {
        'id' => ip.id.to_s,
        'address' => ip.address.to_s,
        'enabled' => ip.enabled,
        'createdAt' => ip.created_at.iso8601,
        'updatedAt' => ip.updated_at.iso8601,
        'pingResults' => [
          {
            'id' => ping_result.id.to_s,
            'rtt' => ping_result.rtt,
            'createdAt' => ping_result.created_at.iso8601,
            'updatedAt' => ping_result.updated_at.iso8601,
            '__typename' => 'PingResult'
          }
        ],
        '__typename' => 'Ip'
      }
    end

    before { Timecop.freeze(2025, 2, 25, 13, 36, 25) }

    after { Timecop.return }

    it { is_expected.to eq(expected_result) }
  end
end
