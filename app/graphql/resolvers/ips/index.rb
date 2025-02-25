# frozen_string_literal: true

module Resolvers
  module Ips
    module Index
      extend ActiveSupport::Concern

      included do
        field :calculate_statistic, resolver: ::Resolvers::Ips::CalculateStatisticResolver
      end
    end
  end
end
