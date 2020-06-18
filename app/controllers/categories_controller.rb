class CategoriesController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create]
  def index
    @categories = Category.includes(:questions).all.order(title: 'ASC')
  end
  
  def new 
    @category = Category.new()
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to categories_url
    else
      
    end
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
