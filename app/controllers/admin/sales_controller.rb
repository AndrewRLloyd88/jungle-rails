class Admin::SalesController < ApplicationController

  def index
    #there is no Sale object no table or no model
    @sales = Sale.all
    # @sales = Product.all
    #render: index
    
  end

end
