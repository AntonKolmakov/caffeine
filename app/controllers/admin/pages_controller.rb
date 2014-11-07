module Admin
  class PagesController < Admin::ApplicationController
    respond_to :js, only: :update

    expose(:decorated_pages) { pages.decorate }
    expose(:pages) { Page.roots_and_descendants_preordered }
    expose(:page, attributes: :page_params, finder: :find_by_slug)

    def index
    end

    def new
      page.build_page_image
      page.build_seo_datum
    end

    def create
      page.save
      respond_with :admin, page, location: -> { edit_admin_page_path(page) }
    end

    def edit
      page.build_page_image unless page.page_image.present?
      page.build_seo_datum unless page.seo_datum.present?
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
      params.require(:page).permit(:main,
                                   :name,
                                   :description,
                                   :short_description,
                                   :slug,
                                   :fix_slug,
                                   :parent_id,
                                   :album_id,
                                   :position).merge(nested_attributes)
    end

    def nested_attributes
      params.require(:page).permit(seo_datum_attributes: %i(id meta_title meta_keywords meta_description seo_text),
                                   page_image_attributes: %i(id picture _destroy))
    end
  end
end
