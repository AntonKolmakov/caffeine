module Casein
  class DocumentsController < Casein::CaseinController
    responders :location, :collection, :flash

    expose(:post, finder: :find_by_slug)
    expose(:documents) { post.documents.order(sort_order(:name)).paginate(page: params[:page]) }
    expose(:document, attributes: :document_params)

    def new
    end

    def create
      document.save
      respond_with(post, location: -> { casein_post_path(post) })
    end

    def destroy
      document.destroy
      respond_with(post, location: -> { casein_post_path(post) })
    end

    private

    def document_params
      params.require(:document).permit(:post_id, :attachment)
    end
  end
end
