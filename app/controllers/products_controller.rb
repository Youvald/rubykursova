class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Товар успішно створено!"
    else
      render :new, alert: "Помилка при створенні товару."
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock)
  end
  before_action :authenticate_admin!, only: [:new, :create]

  private

  def authenticate_admin!
    unless current_user&.role == "admin" # або інша перевірка
      redirect_to root_path, alert: "У вас немає доступу до цієї дії."
    end
  end


  def show
    @product = Product.find(params[:id])
  end

end
