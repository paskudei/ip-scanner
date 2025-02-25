# frozen_string_literal: true

module Ips
  class DisableService
    include Callable

    attr_reader :ip

    def initialize(ip:)
      @ip = ip
    end

    def call
      ip.update!(enabled: false)
    end
  end
end
