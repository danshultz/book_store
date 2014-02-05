class ShoppingCart
  attr_reader :storage

  def initialize(storage)
    @storage = storage
  end

  def add_item(item_id)
    unless item_id.blank?
      self.items = items.push(item_id).uniq
    end
  end

  def remove_item(item_id)
    self.items = items.reject { |i| i == item_id }
  end

  def items
    (storage[:shopping_cart_items] || "").split(',')
  end

  def items=(val)
    storage[:shopping_cart_items] = val.join(',')
  end

end
