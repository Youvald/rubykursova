class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items.includes(:product)
  end

  def add_item
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    current_cart.add_item(product, quantity)

    redirect_to cart_path, notice: 'Товар додано до кошика.'
  end

  def remove_item
    cart_item = @cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_path, notice: 'Товар видалено з корзини.'
  end

  private

  def set_cart
    @cart = current_user.cart
  end
end
