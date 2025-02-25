# frozen_string_literal: true

module Ips
  class MonitoringJob
    include Sidekiq::Job

    def perform(ip_id)
      ip = Ip.find_by(id: ip_id)
      return unless ip
      return unless ip.enabled?

      Ips::MonitoringInteractor.call(ip:)
      Ips::MonitoringJob.perform_in(delay, ip.id)
    end

    private

    def delay
      1.minute
    end
  end
end
