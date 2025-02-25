# frozen_string_literal: true

FactoryBot.define do
  factory :ping_result do
    ip

    rtt { FFaker::Number.decimal }
  end
end
