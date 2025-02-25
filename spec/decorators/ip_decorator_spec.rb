# frozen_string_literal: true

describe IpDecorator do
  subject(:decorator) { described_class.new(object: ip) }

  describe '#pretty_address' do
    subject(:pretty_address) { decorator.pretty_address }

    let(:ip) { create(:ip, address: '192.168.0.1') }

    it { is_expected.to eq('192.168.0.1') }
  end
end
