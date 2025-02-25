# frozen_string_literal: true

class ApplicationDecorator
  attr_reader :object

  def initialize(object:)
    @object = object
  end

  def method_missing(method_name, *, &)
    object.public_send(method_name, *)
  rescue NoMethodError
    super
  end

  def respond_to_missing?(method_name, *args)
    object.respond_to?(method_name, args)
  end
end
