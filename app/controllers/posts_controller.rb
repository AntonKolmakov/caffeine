class PostsController < ApplicationController
  expose(:posts)
  expose(:post, finder: :find_by_slug)

  def show
    self.post = Post.friendly.find(params[:id]).decorate
  end
end
