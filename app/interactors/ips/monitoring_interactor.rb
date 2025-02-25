# frozen_string_literal: true

module Ips
  class MonitoringInteractor
    include Callable

    attr_reader :ip

    def initialize(ip:)
      @ip = ip
    end

    def call
      ping_service = Ips::PingService.call(ip:)
      ping_adapter = Ips::PingAdapter.call(ping_service:)
      PingResults::CreateAfterPingService.call(ip:, ping_adapter:)
    end
  end
end
