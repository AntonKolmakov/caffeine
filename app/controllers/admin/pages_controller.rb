module Admin
  class PagesController < Admin::ApplicationController
    expose(:pages) { Page.order(:position).roots }
    expose(:page, attributes: :page_params, finder: :find_by_slug)

    def index
    end

    def edit
    end

    def new
    end

    def create
      page.save
      respond_with(:admin, page)
    end

    def edit
      binding.pry
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
