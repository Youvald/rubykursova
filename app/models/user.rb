class User < ApplicationRecord
  has_secure_password

  # Валідації
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  # Ролі користувачів
  enum role: { customer: 0, admin: 1 }
end
