class User < ApplicationRecord
  # belongs_to :location
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
