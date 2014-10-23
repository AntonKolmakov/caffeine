module Admin
  class ImportController < Admin::ApplicationController
    def import
      ImportData.call
      Setting.import_at = Time.zone.now
      flash[:notice] = 'import successfully'
      redirect_to rails_settings_ui_url
    end

    def rollback
      ImportData.call(action: 'rollback')
      flash[:notice] = 'rollback successfully'
      redirect_to rails_settings_ui_url
    end
  end
end
