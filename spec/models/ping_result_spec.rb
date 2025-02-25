# frozen_string_literal: true

describe PingResult do
  it { expect(create(:ping_result)).to be_valid }
end
