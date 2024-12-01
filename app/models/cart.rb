class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items

  def add_item(product, quantity)
    current_item = cart_items.find_or_initialize_by(product: product)
    current_item.quantity += quantity
    current_item.save
  end
end
