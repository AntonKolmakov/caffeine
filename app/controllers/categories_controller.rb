class CategoriesController < ApplicationController
  respond_to :html

  expose(:category, attributes: :category_params)
  expose(:categories) { Category.page(params[:page]) }

  def create
    flash[:notice] = 'Category was successfully created.' if category.save
    respond_with(category)
  end

  def update
    flash[:notice] = 'Category was successfully updated.' if category.save
    respond_with(category)
  end

  def destroy
    category.destroy
    respond_with(category)
  end

  private

  def category_params
    params.require(:category).permit(:name, :content, :parent_id)
  end
end
