module Casein
  class AdminApplicationController < Casein::CaseinController
    responders :location, :collection, :flash

    layout 'casein/layouts/casein_main'

    decent_configuration do
      strategy DecentExposure::StrongParametersStrategy
    end
  end
end
