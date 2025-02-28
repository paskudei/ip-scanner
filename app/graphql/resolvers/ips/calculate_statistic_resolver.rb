# frozen_string_literal: true

module Resolvers
  module Ips
    class CalculateStatisticResolver < AbstractScopableResolver
      type ::Types::Ips::IpStatisticType, null: true

      argument :input,
               ::Inputs::Queries::Ips::CalculateStatisticInput,
               description: I18n.t('graphql.description.input'),
               required: true

      def resolve(input:)
        ip = find(scope, input[:id])
        result = calculate_statistic(ip, input)
        return error_message if result.total_checks.zero?

        ip.define_singleton_method(:statistic) { result }
        ip
      end

      private

      def model
        ::Ip
      end

      def calculate_statistic(ip, input)
        ::Ips::CalculateStatisticService.call(
          ip:,
          time_from: input[:time_from],
          time_to: input[:time_to]
        )
      end

      def error_message
        raise_unprocessable_entity!(
          messages: {
            base: 'Статистика отсутствует'
          },
          full_messages: ['Статистика отсутствует']
        )
      end
    end
  end
end
