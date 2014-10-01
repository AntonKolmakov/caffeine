module Admin
  class AlbumsController < AdminsController
    expose(:albums)
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
      respond_with(:admin, album)
    end

    def update
      album.save
      respond_with(:admin, album)
    end

    def destroy
      album.destroy
      respond_with(:admin, album)
    end

    private

    def album_params
      params.require(:album).permit(:name, :parent_id, :watermark)
    end
  end
end
