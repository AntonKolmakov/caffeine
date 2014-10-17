require 'rails-settings-ui'

RailsSettingsUi.setup do |config|
  config.parent_controller = 'Admin::ApplicationController'
  config.settings_class = 'Setting'
end

RailsSettingsUi::ApplicationController.layout 'admin/layouts/application'

Rails.application.config.to_prepare do
  # If you use a *custom layout*, make route helpers available to RailsSettingsUi:
  RailsSettingsUi.inline_main_app_routes!
end
