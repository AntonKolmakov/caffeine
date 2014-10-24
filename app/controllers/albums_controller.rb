class AlbumsController < ApplicationController
  expose(:album, finder: :find_by_slug)
end
