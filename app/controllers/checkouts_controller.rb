class CheckoutsController < ApplicationController

  def new
    @checkout = Checkout.new(cart, Address.all)
  end

  def show
    @checkout = Checkout.new(cart, Address.all)
  end

  def create

    @address = Address.new(address_params)

    if (@address.save)
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
