module Admin
  class ImportsController < Admin::ApplicationController
    def create
      result = AmazonService.call

      if result.success?
        flash[:notice] = t('controllers.admin.import.actions.flash.import.notice')
      else
        flash[:warning] = t('controllers.admin.import.actions.flash.import.warning')
      end
      redirect_to rails_settings_ui_url
    end

    def destroy
      Rollback.call
      flash[:notice] = t('controllers.admin.import.actions.flash.rollback.notice')
      redirect_to rails_settings_ui_url
    end
  end
end
