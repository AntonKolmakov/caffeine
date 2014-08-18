module Casein
  class PostsController < Casein::CaseinController
    responders :location, :flash
    expose(:posts) { Post.order(sort_order(:name)).paginate page: params[:page] }
    expose(:post, attributes: :post_params)

    def index
      @casein_page_title = 'Posts'
    end

    def show
      @casein_page_title = 'View post'
    end

    def edit
      @casein_page_title = 'Edit post'
    end

    def new
      @casein_page_title = 'Add a new post'
    end

    def create
      post.save
      respond_with post, location: -> { casein_posts_path }
    end

    def update
      post.update_attributes post_params
      respond_with post, location: -> { casein_posts_path }
    end

    def destroy
      post.destroy
      respond_with post, location: -> { casein_posts_path }
    end

    private

    def post_params
      params.require(:post).permit(:name, :category_id)
    end
  end
end
