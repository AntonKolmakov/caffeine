module Casein
  class ImagesController < AdminApplicationController
    protect_from_forgery except: :sort

    respond_to :js, only: :create

    expose(:album)
    expose(:images) { album.images.order(sort_order(:name)).paginate(page: params[:page]) }
    expose(:image, attributes: :image_params)

    def edit
    end

    def new
    end

    def create
      image.save
    end

    def update
      image.save
      respond_with(:casein, image)
    end

    def destroy
      image.destroy
      respond_with(album, location: -> { casein_album_path(album) })
    end

    def sort
      params[:image].each_with_index { |image_id, position| Image.find(image_id).update!(position: position) }
      render nothing: true
    end

    private

    def image_params
      params.require(:image).permit(:name, :album_id, :picture)
    end
  end
end
