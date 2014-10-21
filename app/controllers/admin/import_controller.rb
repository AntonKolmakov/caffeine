module Admin
  class ImportController < Admin::ApplicationController
    def import
      ImportData.call
      flash[:notice] = 'import successfully'
      redirect_to rails_settings_ui_url
    end
  end
end
