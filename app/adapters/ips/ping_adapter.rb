# frozen_string_literal: true

module Ips
  class PingAdapter
    include Callable

    attr_reader :ping_service
    attr_accessor :rtt

    def initialize(ping_service:)
      @ping_service = ping_service
    end

    def call
      adapt_data
      self
    end

    private

    def adapt_data
      self.rtt = ping_service.duration
    end
  end
end
