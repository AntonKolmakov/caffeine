module Casein
  class PostAttachmentsController < Casein::CaseinController
    responders :location, :collection, :flash
    respond_to :js, only: :create

    expose(:post, finder: :find_by_slug)
    expose(:post_attachments, ancestor: :post)
    expose(:post_attachment, attributes: :post_attachment_params)

    def create
      post_attachment.save
    end

    def destroy
      post_attachment.destroy
      respond_with(post, location: -> { casein_post_path(post) })
    end

    private

    def post_attachment_params
      params.require(:post_attachment).permit(:post_id, :attachment)
    end
  end
end
