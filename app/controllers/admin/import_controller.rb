module Admin
  class ImportController < Admin::ApplicationController
    def import
      result = ImportData.call

      if result.success?
        Setting.import_at = Time.zone.now
        flash[:notice] = t('controllers.admin.import.actions.flash.import.notice')
      else
        flash[:warning] = t('controllers.admin.import.actions.flash.import.warning')
      end
      redirect_to rails_settings_ui_url
    end

    def rollback
      ImportData.call(rollback: true)
      flash[:notice] = t('controllers.admin.import.actions.flash.rollback.notice')
      redirect_to rails_settings_ui_url
    end
  end
end
