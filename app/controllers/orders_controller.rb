class OrdersController < ApplicationController

  def create

    @order = current_user.orders.create!(:books => cart.books)
    redirect_to(:action => :show, :id => @order.id)

  end

  def show
    @order = Order.find(params[:id])
  end

  private

    def cart
      @cart ||= ShoppingCart.new(cookies.permanent.signed)
    end
end
