module Admin
  class SettingsController < Admin::ApplicationController
    before_action :require_super_admin

    helper_method :cached_time

    expose(:import_file) { ImportFile.new.s3_file }

    private

    # We use `main_app.admin_root_path` because `rails_settings_ui`
    # can not use app route helpers directly
    # https://github.com/accessd/rails-settings-ui#issues
    def require_super_admin
      redirect_to main_app.admin_root_path unless current_admin_user.admin?
    end

    def cached_time
      Rails.cache.fetch('time', expires_in: 2.hour) { import_file.last_modified }
    end
  end
end
