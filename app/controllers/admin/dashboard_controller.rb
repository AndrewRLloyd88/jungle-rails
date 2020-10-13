class Admin::DashboardController < ApplicationController
  #adding basic http authentication for admins
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
  password: ENV["HTTP_BASIC_PASSWORD"],
  if: -> { ENV["HTTP_BASIC_PASSWORD"].present? }
  def show
    #controller is fetching the data and making it available to the views automagically
    @product_count = Product.count
    @category_count = Category.count
  end
end
