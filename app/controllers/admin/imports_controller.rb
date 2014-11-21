module Admin
  class ImportsController < Admin::ApplicationController
    def create
      ImportProductionSiteData::Import.call
      redirect_to rails_settings_ui_url,
                  notice: t('controllers.admin.import.actions.flash.import.notice')
    end

    def destroy
      RollbackImportedData::Rollback.call
      flash[:notice] = t('controllers.admin.import.actions.flash.rollback.notice')
      redirect_to rails_settings_ui_url
    end
  end
end
