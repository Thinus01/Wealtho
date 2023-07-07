class MainController < ApplicationController
  def home
    @categories = Category.all.order(:id)
    render 'main/home'
  end
end
