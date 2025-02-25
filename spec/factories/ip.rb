# frozen_string_literal: true

FactoryBot.define do
  factory :ip do
    address { FFaker::Internet.ip_v4_address }
    enabled { FFaker::Boolean.random }
  end
end
