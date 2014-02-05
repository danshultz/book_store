class ShoppingCartsController < ApplicationController

  def show
    books = Book.where(:id => cart_items)
    render(:show, :locals => { :books => books })
  end


  def update
    self.cart_items = cart_items.push(book_id).uniq
    redirect_to(shopping_cart_url)
  end


  def destroy
    self.cart_items = cart_items.reject { |i| i == book_id }
    redirect_to(shopping_cart_url)
  end

  private

    def book_id
      params[:book] && params[:book][:id]
    end

    def cart_items
      (cookies.signed[:shopping_cart_items] || "").split(',')
    end

    def cart_items=(val)
      cookies.permanent.signed[:shopping_cart_items] = val.join(',')
    end

end
