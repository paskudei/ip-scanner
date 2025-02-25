# frozen_string_literal: true

class Ip < ApplicationRecord
  has_many :ping_results, dependent: :destroy

  validates :address, uniqueness: true, format: Resolv::AddressRegex
end
