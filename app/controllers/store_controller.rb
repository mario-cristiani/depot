class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
    
    if session[:index_count].nil?
      session[:index_count] = 1
    else
      session[:index_count] += 1
    end
  end
end