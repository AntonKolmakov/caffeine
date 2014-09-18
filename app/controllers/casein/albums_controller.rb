module Casein
  class AlbumsController < AdminApplicationController
    expose(:albums) { Album.order(sort_order(:name)).paginate page: params[:page] }
    expose(:album, attributes: :album_params)

    def index
    end

    def show
    end

    def edit
    end

    def new
    end

    def create
      album.save
      respond_with(:casein, album)
    end

    def update
      album.save
      respond_with(:casein, album)
    end

    def destroy
      album.destroy
      respond_with(:casein, album)
    end

    private

    def album_params
      params.require(:album).permit(:name, :parent_id)
    end
  end
end
