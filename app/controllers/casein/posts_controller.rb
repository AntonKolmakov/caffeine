module Casein
  class PostsController < Casein::CaseinController
    expose(:post, attributes: :post_params)
    expose(:posts) { Post.order(sort_order(:name)).paginate page: params[:page] }

    def index
      @casein_page_title = 'Posts'
    end

    def show
      @casein_page_title = 'View post'
    end

    def new
      @casein_page_title = 'Add a new post'
    end

    def create
      if post.save
        flash[:notice] = 'Post created'
        redirect_to casein_posts_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new post'
        render action: :new
      end
    end

    def update
      @casein_page_title = 'Update post'
      if post.update_attributes post_params
        flash[:notice] = 'Post has been updated'
        redirect_to casein_posts_path
      else
        flash.now[:warning] = 'There were problems when trying to update this post'
        render action: :show
      end
    end

    def destroy
      @post.destroy
      flash[:notice] = 'Post has been deleted'
      redirect_to casein_posts_path
    end

    private

    def post_params
      params.require(:post).permit(:name, :category_id)
    end
  end
end
