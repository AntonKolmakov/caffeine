module Admin
  class PageAttachmentsController < Admin::ApplicationController
    respond_to :js, only: :create

    expose(:page, find_by: :slug)
    expose(:page_attachments, from: :page)
    expose :page_attachment, scope: ->{ page.page_attachments } #build new page_attachment

    def create
      page_attachment.save
    end

    def destroy
      page_attachment.destroy
      respond_with(page, location: -> { edit_admin_page_path(page) })
    end

    private

    def page_attachment_params
      params.require(:page_attachment).permit(:page_id, :attachment)
    end
  end
end
