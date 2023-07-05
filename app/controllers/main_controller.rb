class MainController < ApplicationController
  def home
    @categories = Category.all.order(:id)
  end
end
