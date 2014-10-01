module Admin
  class ApplicationController < ::ApplicationController
    responders :location, :collection, :flash

    before_action :authenticate_user!

    layout 'admin/layouts/application'

    decent_configuration do
      strategy DecentExposure::StrongParametersStrategy
    end
  end
end
