module Casein
  module ConfigHelper
    def casein_config_website_name
      'Casein'
    end

    # Filename of logo image. Ideally, it should be a transparent PNG around 140x30px
    def casein_config_logo
      'casein/casein.png'
    end

    # The server hostname where Casein will run
    def casein_config_hostname
      if Rails.env.production?
        'http://www.caseincms.com'
      else
        'http://prom-techno-sert.dev'
      end
    end

    # The sender address used for email notifications
    def casein_config_email_from_address
      'donotreply@caseincms.com'
    end

    # Do not point this at casein/index!
    def casein_config_dashboard_url
      # url_for :controller => :casein, :action => :blank
      url_for casein_categories_path
    end

    def casein_config_stylesheet_includes
      %w(casein/casein casein/custom)
    end

    def casein_config_javascript_includes
      %w(casein/casein casein/custom)
    end
  end
end
