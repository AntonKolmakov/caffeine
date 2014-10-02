class MainPageController < ApplicationController
  expose(:page) { Page.root.decorate }

  def index
    render template: 'pages/show'
  end
end
