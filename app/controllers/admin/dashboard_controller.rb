class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with :name => ENV["HTTP_USER"], :password => ENV["HTTP_PASSWORD"]

  def show
    @product_count = Product.all
    @category_count = Category.all
  end
end
