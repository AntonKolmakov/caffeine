module Admin
  class ApplicationController < ::ApplicationController
    responders :location, :flash

    before_action :authenticate_admin_user!

    layout 'admin/layouts/application'

    protected

    def devise_parameter_sanitizer
      if resource_class == User
        User::ParameterSanitizer.new(User, :user, params)
      else
        super
      end
    end
  end
end
