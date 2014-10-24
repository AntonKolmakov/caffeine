class MainPageController < ApplicationController
  expose(:page) { Page.friendly.find('services').decorate }

  def index
    render template: 'pages/show'
  end
end
