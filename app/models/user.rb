class User < ApplicationRecord
  has_secure_password

  # Валідації
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_one :cart, dependent: :destroy
  after_create :create_cart

  private

  def create_cart
    Cart.create(user: self)
  end
  # Ролі користувачів
  enum role: { customer: 0, admin: 1 }
end
