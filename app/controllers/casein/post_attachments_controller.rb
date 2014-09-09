module Casein
  class PostAttachmentsController < AdminApplicationController
    respond_to :js, only: :create

    expose(:page, finder: :find_by_slug)
    expose(:post_attachments, ancestor: :page)
    expose(:post_attachment, attributes: :post_attachment_params)

    def create
      post_attachment.save
    end

    def destroy
      post_attachment.destroy
      respond_with(page, location: -> { casein_page_path(page) })
    end

    private

    def post_attachment_params
      params.require(:post_attachment).permit(:page_id, :attachment)
    end
  end
end
