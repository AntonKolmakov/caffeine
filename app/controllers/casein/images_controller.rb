module Casein
  class ImagesController < Casein::CaseinController
    responders :collection, :flash

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
      respond_with(:casein, album, image)
    end

    private

    def image_params
      params.require(:image).permit(:name, :album_id, :picture)
    end
  end
end
