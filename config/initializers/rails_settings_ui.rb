require 'rails-settings-ui'

Rails.application.config.to_prepare do
  RailsSettingsUi::ApplicationController.module_eval { layout 'admin/layouts/application' }

  # If you use a *custom layout*, make route helpers available to RailsSettingsUi:
  RailsSettingsUi.inline_main_app_routes!
end

RailsSettingsUi.setup do |config|
  config.parent_controller = 'Admin::SettingsController'
  config.settings_class = 'Setting'
end
