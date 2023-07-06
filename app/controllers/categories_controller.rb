class CategoriesController < ApplicationController
  before_action :set_active_storage_url_options, only: [:index, :show]

  def index
    @categories = Category.all.order(:id)
    @category_totals = {}
  
    @categories.each do |category|
      total_price = category.transactions.sum(:transaction_price)
      @category_totals[category.id] = total_price
  end
end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path, notice: "Category was successfully created."
    else
      render :new
    end
  end

  private

  def set_active_storage_url_options
    ActiveStorage::Current.url_options = url_options
  end

  def category_params
    params.require(:category).permit(:name, :image, :created_at)
  end
end
