class AdminsController < ApplicationController
  responders :location, :collection, :flash

  layout 'admin/layouts/application'

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end