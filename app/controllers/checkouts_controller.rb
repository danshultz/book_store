class CheckoutsController < ApplicationController

  def show
    @cart ||= ShoppingCart.new(cookies.permanent.signed)
  end
 
end
