# frozen_string_literal: true

# Categories controller for normal users
class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end
end
