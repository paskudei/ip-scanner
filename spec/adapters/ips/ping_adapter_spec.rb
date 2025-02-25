# frozen_string_literal: true

describe Ips::PingAdapter do
  subject(:adapter) { described_class }

  describe '.call' do
    subject(:adapter_call) { adapter.call(ping_service:) }

    context 'when rtt with value' do
      let(:ping_service) { Struct.new(:duration).new(123) }

      it { expect(adapter_call.rtt).to eq(123) }
    end

    context 'when rtt without value' do
      let(:ping_service) { Struct.new(:duration).new(nil) }

      it { expect(adapter_call.rtt).to be_nil }
    end
  end
end
