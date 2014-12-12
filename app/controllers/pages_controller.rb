class PagesController < ApplicationController
  expose(:pages)
  expose(:page)

  def show
    page = Page.find_by_path(params[:page_path].split('/'))
    if page
      self.page = page.decorate
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
