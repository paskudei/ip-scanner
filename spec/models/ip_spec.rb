# frozen_string_literal: true

describe Ip do
  context 'when address is IPv4' do
    it { expect(create(:ip, address: '127.0.0.1')).to be_valid }
  end

  context 'when address is IPv6' do
    it { expect(create(:ip, address: '0:0:0:0:0:0:0:1')).to be_valid }
  end
end
