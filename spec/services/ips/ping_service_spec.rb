# frozen_string_literal: true

describe Ips::PingService do
  subject(:service) { described_class }

  describe '.call' do
    subject(:service_call) { service.call(ip:) }

    let(:ip) { create(:ip, address: '77.88.8.8') }

    let(:net_ping) do
      instance_double(
        Net::Ping::External,
        duration: 0.031519093, exception: nil, host: '77.88.8.8', port: 7, timeout: 1, warning: nil
      )
    end

    before do
      allow(Net::Ping::External).to receive(:new).and_return(net_ping)
      allow(net_ping).to receive(:ping?).and_return(true)
    end

    it { expect(service_call).to eq(net_ping) }
  end
end
