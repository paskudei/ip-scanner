# frozen_string_literal: true

module API
  module V1
    class Ips < Grape::API
      format :json

      resource :ips do
        params do
          requires :enabled, type: Boolean, desc: 'Enable or disable IP'
          requires :address, type: String, desc: 'IPv4 or IPv6 address'
        end
        post do
          ip = Ip.create!(params)
          ::Ips::MonitoringJob.perform_async(ip.id)
          present ip, with: API::V1::Entities::Ip
        end

        params do
          requires :id, type: Integer, desc: 'IP ID'
        end
        post ':id/enable' do
          ip = Ip.find(params[:id])
          unless ip.enabled?
            ::Ips::EnableService.call(ip:)
            ::Ips::MonitoringJob.perform_async(ip.id)
          end

          present ip, with: API::V1::Entities::Ip
        end

        params do
          requires :id, type: Integer, desc: 'IP ID'
        end
        post ':id/disable' do
          ip = Ip.find(params[:id])
          ::Ips::DisableService.call(ip:)

          present ip, with: API::V1::Entities::Ip
        end

        params do
          requires :id, type: Integer, desc: 'IP ID'
          requires :time_from, type: DateTime, desc: 'Start time for statistics'
          requires :time_to, type: DateTime, desc: 'End time for statistics'
        end
        get ':id/stats' do
          ip = Ip.find(params[:id])
          statistic = ::Ips::CalculateStatisticService.call(
            ip:,
            time_from: params[:time_from],
            time_to: params[:time_to]
          )

          return { error: 'Статистика отсутствует' } if statistic.total_checks.zero?

          {
            statistic: {
              avg_rtt: statistic.avg_rtt,
              min_rtt: statistic.min_rtt,
              max_rtt: statistic.max_rtt,
              median_rtt: statistic.median_rtt,
              std_dev: statistic.std_dev,
              packet_loss: statistic.packet_loss
            }
          }
        end

        params do
          requires :id, type: Integer, desc: 'IP ID'
        end
        delete ':id' do
          ip = Ip.find(params[:id])
          ::Ips::DisableService.call(ip:)
          present ip, with: API::V1::Entities::Ip
        end
      end
    end
  end
end
