# frozen_string_literal: true

module Ips
  class PingService
    include Callable

    attr_reader :ip, :port, :timeout
    attr_accessor :rtt

    def initialize(ip:, port: nil, timeout: 1)
      @ip = ip
      @port = port
      @timeout = timeout
    end

    def call
      request = Net::Ping::External.new(ip.decorate.pretty_address, port, timeout)
      request.ping?
      request
    end
  end
end
