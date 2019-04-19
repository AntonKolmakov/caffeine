module Admin
  class PageImagesController < Admin::ApplicationController
    expose(:page, find_by: :slug)
    expose :page_image, scope: ->{ page_image.page }

    def create
      page_image.save
      respond_with :admin, page_image, location: -> { edit_admin_page_path(page) }
    end

    def update
      page_image.save
      respond_with :admin, page_image, location: -> { edit_admin_page_path(page) }
    end

    private

    def image_params
      params.require(:page_image).permit(:picture)
    end
  end
end
