# frozen_string_literal: true

describe Ips::MonitoringInteractor do
  subject(:interactor) { described_class }

  describe '.call' do
    subject(:interactor_call) { interactor.call(ip:) }

    let(:ip) { create(:ip) }

    context 'when ping service with success result' do
      let(:ping_service_result) do
        instance_double(
          Net::Ping::External,
          duration: 0.002345, exception: nil, host: '192.168.0.1', timeout: 1, warning: nil
        )
      end
      let(:ping_result) { PingResult.last }

      before { allow(Ips::PingService).to receive(:call).and_return(ping_service_result) }

      it { expect { interactor_call }.to change(PingResult, :count).by(1) }

      it do
        interactor_call
        expect(ping_result.rtt).to eq(0.002345)
      end
    end

    context 'when ping service with failure result' do
      let(:ping_service_result) do
        instance_double(
          Net::Ping::External,
          duration: nil, exception: 'Error message', host: '192.168.0.1', timeout: 1, warning: 'Warning'
        )
      end
      let(:ping_result) { PingResult.last }

      before { allow(Ips::PingService).to receive(:call).and_return(ping_service_result) }

      it { expect { interactor_call }.to change(PingResult, :count).by(1) }

      it do
        interactor_call
        expect(ping_result.rtt).to be_nil
      end
    end
  end
end
