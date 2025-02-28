# frozen_string_literal: true

module Resolvers
  module Ips
    module Index
      extend ActiveSupport::Concern

      included do
        field :ip, resolver: ::Resolvers::Ips::IpResolver

        field :calculate_statistic, resolver: ::Resolvers::Ips::CalculateStatisticResolver
      end
    end
  end
end
