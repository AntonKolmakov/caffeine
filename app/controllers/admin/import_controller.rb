module Admin
  class ImportController < Admin::ApplicationController
    def import
      ImportData.call
      flash[:notice] = 'import successfully'
      redirect_to admin_root_path
    end
  end
end
