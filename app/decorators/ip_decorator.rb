# frozen_string_literal: true

class IpDecorator < ApplicationDecorator
  def pretty_address
    object.address.to_s
  end
end
