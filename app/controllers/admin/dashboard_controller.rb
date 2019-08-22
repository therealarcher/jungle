class Admin::DashboardController < ApplicationController

  def show
    @product_count = Product.all
    @category_count = Category.all
  end
end
