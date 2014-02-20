class Checkout

  def initialize(cart, addresses)
    @cart = cart
    @addresses = addresses
  end

  def cart
    @cart
  end

  def addresses
    @addresses
  end

end
