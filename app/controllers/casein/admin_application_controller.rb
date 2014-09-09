module Casein
  class AdminApplicationController < Casein::CaseinController
    responders :location, :collection, :flash

    layout 'casein/layouts/casein_main'
  end
end
