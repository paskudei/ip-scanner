# frozen_string_literal: true

module Callable
  extend ActiveSupport::Concern

  included do
    def self.call(**args)
      new(**args).call
    end
  end
end
