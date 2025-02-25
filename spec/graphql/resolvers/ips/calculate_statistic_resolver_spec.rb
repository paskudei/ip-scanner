# frozen_string_literal: true

describe Resolvers::Ips::CalculateStatisticResolver do
  include_context 'with graphql query execution', with_input_variables: true

  let(:query) do
    <<-GRAPHQL
      query CalculateStatistic($input: CalculateStatisticInput!) {
        ip: calculateStatistic(input: $input) {
          #{subquery}
        }
      }
    GRAPHQL
  end

  context 'with success result' do
    subject { query_execution.dig('data', 'ip') }

    let(:subquery) do
      <<-GRAPHQL
        id
        statistic {
          avgRtt
          minRtt
          maxRtt
          medianRtt
          stdDev
          packetLoss
        }
        __typename
      GRAPHQL
    end

    let!(:ip) { create(:ip) }
    let(:input) { { id: ip.id, timeFrom: '2025-02-24T16:24:35+00:00', timeTo: '2025-02-26T16:24:35+00:00' } }

    let(:expected_result) do
      {
        'id' => ip.id.to_s,
        'statistic' => {
          'avgRtt' => 0.00522,
          'maxRtt' => 0.00987,
          'medianRtt' => 0.00456,
          'minRtt' => 0.00123,
          'packetLoss' => 25.0,
          'stdDev' => 0.00435764844841802
        },
        '__typename' => 'IpStatistic'
      }
    end

    before do
      Timecop.freeze(2025, 2, 25, 13, 36, 25)

      create(:ping_result, ip:, rtt: 0.00123)
      create(:ping_result, ip:, rtt: 0.00456)
      create(:ping_result, ip:, rtt: 0.00987)
      create(:ping_result, ip:, rtt: nil)
    end

    after { Timecop.return }

    it { is_expected.to eq(expected_result) }

    context 'with minimum data' do
      let(:subquery) do
        <<-GRAPHQL
          id
          __typename
        GRAPHQL
      end

      let(:expected_result) do
        {
          'id' => ip.id.to_s,
          '__typename' => 'IpStatistic'
        }
      end

      it { is_expected.to eq(expected_result) }
    end
  end

  context 'with failure result' do
    let(:subquery) do
      <<-GRAPHQL
        id
        __typename
      GRAPHQL
    end

    let!(:ip) { create(:ip) }
    let(:input) { { id: ip.id, timeFrom: '2025-02-24T16:24:35+00:00', timeTo: '2025-02-26T16:24:35+00:00' } }

    before { Timecop.freeze(2025, 2, 25, 13, 36, 25) }

    after { Timecop.return }

    it { expect(response_validation_errors).to eq({ 'base' => 'Статистика отсутствует' }) }
    it { expect(response_validation_messages).to eq(['Статистика отсутствует']) }
  end
end
