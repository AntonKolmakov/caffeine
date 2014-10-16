class PagesController < ApplicationController
  expose(:pages)
  expose(:page)

  def show
    self.page = Page.friendly.find(params[:id]).decorate
  end
end
