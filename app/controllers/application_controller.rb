class ApplicationController < ActionController::Base
  respond_to :html

  protect_from_forgery

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "log_in"
    else
      "application"
    end
  end

  protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end

  decent_configuration do
    strategy DecoratorStrategy
  end
end
