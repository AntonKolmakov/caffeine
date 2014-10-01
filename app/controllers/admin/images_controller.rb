module Admin
  class ImagesController < Admin::ApplicationController
    protect_from_forgery except: :sort

    respond_to :js, only: :create

    expose(:album)
    expose(:images, ancestor: :album)
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
      respond_with(:admin, image)
    end

    def destroy
      image.destroy
      respond_with(album, location: -> { edit_admin_album_path(album) })
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
