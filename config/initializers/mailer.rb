ActionMailer::Base.instance_eval do
  self.default from: %("Caffeine CMS" <#{app_config.noreply}>)
  self.default_url_options[:host] = app_config.host
end
