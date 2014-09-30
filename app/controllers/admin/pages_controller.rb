module Admin
  class PagesController < AdminsController
    expose(:pages) { Page.order('position ASC') }
    expose(:page, attributes: :page_params, finder: :find_by_slug)

    def index
    end

    def show
    end

    def edit
    end

    def new
    end

    def create
      page.save
      respond_with(:admin, page)
    end

    def update
      page.save
      respond_with(:admin, page)
    end

    def destroy
      page.destroy
      respond_with(:admin, page)
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
