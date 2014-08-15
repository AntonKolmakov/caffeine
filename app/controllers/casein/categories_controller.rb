module Casein
  class CategoriesController < Casein::CaseinController
    expose(:category, attributes: :category_params)
    expose(:categories) { Category.order(sort_order(:name)).paginate page: params[:page] }

    def index
      @casein_page_title = 'Categories'
    end

    def show
      @casein_page_title = 'View category'
    end

    def new
      @casein_page_title = 'Add a new category'
    end

    def create
      if category.save
        flash[:notice] = 'Category created'
        redirect_to casein_categories_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new category'
        render action: :new
      end
    end

    def update
      @casein_page_title = 'Update category'
      if category.update_attributes category_params
        flash[:notice] = 'Category has been updated'
        redirect_to casein_categories_path
      else
        flash.now[:warning] = 'There were problems when trying to update this category'
        render action: :show
      end
    end

    def destroy
      category.destroy
      flash[:notice] = 'Category has been deleted'
      redirect_to casein_categories_path
    end

    private

    def category_params
      params.require(:category).permit(:name, :content, :parent_id)
    end
  end
end
