class ShoppingCartsController < ApplicationController

  def show
    books = Book.where(:id => cart.items)
    render(:show, :locals => { :books => books })
  end


  def update
    cart.add_item(book_id)
    redirect_to(shopping_cart_url)
  end


  def destroy
    cart.remove_item(book_id)
    redirect_to(shopping_cart_url)
  end

  private

    def book_id
      params[:book] && params[:book][:id]
    end


    def cart
      @cart ||= ShoppingCart.new(cookies.permanent.signed)
    end

end
