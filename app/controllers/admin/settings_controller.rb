module Admin
  class SettingsController < Admin::ApplicationController
    before_action :require_super_admin

    private

    # We use `main_app.admin_root_path` because `rails_settings_ui`
    # can not use app route helpers directly
    # https://github.com/accessd/rails-settings-ui#issues
    def require_super_admin
      redirect_to main_app.admin_root_path unless current_admin_user.admin?
    end
  end
end
