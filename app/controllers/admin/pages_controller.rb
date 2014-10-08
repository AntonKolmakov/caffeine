module Admin
  class PagesController < Admin::ApplicationController
    expose(:pages)
    expose(:page, attributes: :page_params, finder: :find_by_slug)

    def index
      self.pages = Page.roots_and_descendants_preordered.decorate
    end

    def new
    end

    def create
      page.save
      respond_with :admin, page, location: -> { edit_admin_page_path(page) }
    end

    def edit
    end

    def update
      page.save
      respond_with :admin, page, location: -> { edit_admin_page_path(page) }
    end

    def destroy
      page.destroy
      respond_with :admin, page
    end

    private

    def page_params
      params.require(:page).permit(:name,
                                   :description,
                                   :short_description,
                                   :slug,
                                   :fix_slug,
                                   :parent_id,
                                   :album_id,
                                   :position)
    end
  end
end
