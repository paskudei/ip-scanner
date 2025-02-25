# frozen_string_literal: true

describe Ips::DisableService do
  subject(:service) { described_class }

  describe '.call' do
    subject(:service_call) { service.call(ip:) }

    context 'with success result' do
      let(:ip) { create(:ip, enabled: true) }

      it { expect { service_call }.to change(ip, :enabled).from(true).to(false) }
    end

    context 'without any changes' do
      let(:ip) { create(:ip, enabled: false) }

      it { expect { service_call }.not_to change(ip, :enabled) }
    end
  end
end
