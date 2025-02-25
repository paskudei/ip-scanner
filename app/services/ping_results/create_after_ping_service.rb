# frozen_string_literal: true

module PingResults
  class CreateAfterPingService
    include Callable

    attr_reader :ip, :ping_adapter

    def initialize(ip:, ping_adapter:)
      @ip = ip
      @ping_adapter = ping_adapter
    end

    def call
      PingResult.create!(
        ip:,
        rtt: ping_adapter.rtt
      )
    end
  end
end
