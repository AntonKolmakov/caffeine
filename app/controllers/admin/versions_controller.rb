module Admin
  class VersionsController < Admin::ApplicationController
    expose(:page, finder: :find_by_slug)

    def revert
      @version = PaperTrail::Version.find(params[:version])
      @version.reify.save!
      redirect_to edit_admin_page_path(@version.reify), notice: "Undid #{@version.event}"
    end
  end
end
