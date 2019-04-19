class DecoratorStrategy < ApplicationController
  def resource
    res = super.tap { |r| r.class.send(:include, Draper::Decoratable) unless r.respond_to?(:decorate) }
    res.decorate
  rescue Draper::UninferrableDecoratorError
    res
  end
end
