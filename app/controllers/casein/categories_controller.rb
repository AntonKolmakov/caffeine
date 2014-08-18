module Casein
  class CategoriesController < Casein::CaseinController
    responders :collection, :flash
    expose(:categories) { Category.order(sort_order(:name)).paginate page: params[:page] }
    expose(:category, attributes: :category_params)

    def index
      @casein_page_title = 'Categories'
    end

    def show
      @casein_page_title = 'View category'
    end

    def edit
      @casein_page_title = 'Edit category'
    end

    def new
      @casein_page_title = 'Add a new category'
    end

    def create
      category.save
      respond_with(:casein, category)
    end

    def update
      category.save category_params
      respond_with(:casein, category)
    end

    def destroy
      category.destroy
      respond_with(:casein, category)
    end

    private

    def category_params
      params.require(:category).permit(:name, :content, :parent_id)
    end
  end
end
