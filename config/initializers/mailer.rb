ActionMailer::Base.instance_eval do
  self.default from: "\"АНО Промтехносерт\" <noreply@promtehnosert.ru>"
  self.default_url_options[:host] = app_config.host
end
