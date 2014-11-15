module Admin
  class PagesController < Admin::ApplicationController
    respond_to :js, only: :update

    expose(:decorated_pages) { pages.decorate }
    expose(:pages) { Page.roots_and_descendants_preordered }
    expose(:page, attributes: :page_params, finder: :find_by_slug)
    expose(:version) { PaperTrail::Version.find(params[:version]) }
    expose(:page_versions) { page.versions }

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

    def version_page
      data = CompareVersion.call(version_page: params[:version_page], current_page: page)
      render text: data.result
    end

    # Allows you switch on specific version
    def revert_version
      version.reify(has_one: true).save!
      redirect_to edit_admin_page_path(version.reify), notice: "Undid #{version.event}"
    end

    def destroy
      page.destroy
      respond_with :admin, page
    end

    private

    def user_for_paper_trail
      current_admin_user
    end

    def page_params
      params.require(:page).permit(:main,
                                   :random_token,
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
