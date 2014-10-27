module Admin
  class ImportController < Admin::ApplicationController
    def import
      result = ImportData.call

      if result.success?
        Setting.import_at = Time.zone.now
        flash[:notice] = 'import successfully'
      else
        flash[:warning] = 'buket are not finded on s3'
      end
      redirect_to rails_settings_ui_url
    end

    def rollback
      ImportData.call(action: 'rollback')
      flash[:notice] = 'rollback successfully'
      redirect_to rails_settings_ui_url
    end
  end
end
