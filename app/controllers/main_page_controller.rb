class MainPageController < ApplicationController
  expose(:page) { Page.main.first.decorate }

  def index
    render template: 'pages/show'
  end
end
