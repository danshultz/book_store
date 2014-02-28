class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def create

    @order = current_user.orders.create!(:books => cart.books)
    redirect_to(:action => :show, :id => @order.id)

  end

  def show
    @order = Order.user(current_user).find(params[:id])
  end

  private

    def cart
      @cart ||= ShoppingCart.new(cookies.permanent.signed)
    end

end
