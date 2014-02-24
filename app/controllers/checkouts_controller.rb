class CheckoutsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @checkout = Checkout.new(cart, current_user.addresses.all)
  end

  def show
    @checkout = Checkout.new(cart, current_user.addresses.all)
  end

  def create

    if current_user.addresses.create(address_params)
      redirect_to(checkout_path, notice: 'Address was successfully saved.')
    else
      render(action: 'new')
    end

  end

  private

    def cart
      @cart ||= ShoppingCart.new(cookies.permanent.signed)
    end

    def address_params
      params
        .require(:address)
        .permit(:first_name, :last_name, :address1, :address2, :city, :state, :postal_code, :country)
    end
 
end
