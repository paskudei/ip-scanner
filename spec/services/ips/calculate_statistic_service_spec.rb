# frozen_string_literal: true

describe Ips::CalculateStatisticService do
  subject(:service) { described_class }

  describe '.call' do
    subject(:service_call) { service.call(ip:, time_from:, time_to:) }

    let(:ip) { create(:ip) }
    let(:time_from) { DateTime.current - 1.day }
    let(:time_to) { DateTime.current + 1.day }

    before { Timecop.freeze(2025, 2, 25, 13, 36, 25) }

    after { Timecop.return }

    context 'with ping results' do
      before do
        create(:ping_result, ip:, rtt: 0.00123)
        create(:ping_result, ip:, rtt: 0.00456)
        create(:ping_result, ip:, rtt: 0.00987)
        create(:ping_result, ip:, rtt: nil)
      end

      it { expect(service_call.total_checks).to eq(4) }
      it { expect(service_call.avg_rtt).to eq(0.00522) }
      it { expect(service_call.min_rtt).to eq(0.00123) }
      it { expect(service_call.max_rtt).to eq(0.00987) }
      it { expect(service_call.median_rtt).to eq(0.00456) }
      it { expect(service_call.std_dev).to eq(0.00435764844841802) }
      it { expect(service_call.packet_loss).to eq(25.0) }
    end

    context 'without ping results' do
      it { expect(service_call.total_checks).to eq(0) }
      it { expect(service_call.avg_rtt).to be_nil }
      it { expect(service_call.min_rtt).to be_nil }
      it { expect(service_call.max_rtt).to be_nil }
      it { expect(service_call.median_rtt).to be_nil }
      it { expect(service_call.std_dev).to be_nil }
      it { expect(service_call.packet_loss).to eq(0.0) }
    end
  end
end
