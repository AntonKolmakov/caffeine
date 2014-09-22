module Casein
  class PagesController < AdminApplicationController
    expose(:pages)
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
      respond_with(:casein, page)
    end

    def update
      page.save
      respond_with(:casein, page)
    end

    def destroy
      page.destroy
      respond_with(:casein, page)
    end

    private

    def page_params
      params.require(:page).permit(:name, :description, :short_description, :slug, :fix_slug, :parent_id, :album_id)
    end
  end
end
