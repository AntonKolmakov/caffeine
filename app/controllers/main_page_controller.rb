class MainPageController < ApplicationController
  expose(:page) { Page.main.decorate }

  def index
    render template: 'pages/show'
  end
end
