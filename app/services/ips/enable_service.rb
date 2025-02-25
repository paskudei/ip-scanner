# frozen_string_literal: true

module Ips
  class EnableService
    include Callable

    attr_reader :ip

    def initialize(ip:)
      @ip = ip
    end

    def call
      ip.update!(enabled: true)
    end
  end
end
