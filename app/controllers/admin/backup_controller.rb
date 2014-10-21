module Admin
  class BackupController < Admin::ApplicationController
    def export
      ExportData.call
      flash[:notice] = 'export successfully'
      redirect_to admin_root_path
    end

    def import
      ImportData.call
      flash[:notice] = 'import successfully'
      redirect_to admin_root_path
    end
  end
end