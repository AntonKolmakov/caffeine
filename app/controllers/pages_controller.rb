class PagesController < ApplicationController
  expose(:pages)
  expose(:page, finder: :find_by_slug)

  def show
    self.page = Page.friendly.find(params[:id]).decorate
  end
end
