module Admin
  class AlbumsController < Admin::ApplicationController
    expose(:albums)
    expose(:album, attributes: :album_params)

    def index
    end

    def new
      album.build_seo_datum
    end

    def edit
      album.build_seo_datum unless album.seo_datum.present?
    end

    def create
      album.save
      respond_with :admin, album, location: -> { edit_admin_album_path(album) }
    end

    def update
      album.save
      respond_with :admin, album, location: -> { edit_admin_album_path(album) }
    end

    def destroy
      album.destroy
      respond_with :admin, album
    end

    private

    def album_params
      params.require(:album).permit(:name,
                                    :parent_id,
                                    :watermark,
                                    seo_datum_attributes: %i(id meta_title meta_keywords meta_description seo_text))
    end
  end
end
