# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def decorate
    ("#{self.class.name}Decorator".safe_constantize || ::ApplicationDecorator).new(object: self)
  end
end
