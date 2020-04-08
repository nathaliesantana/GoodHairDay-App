class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :products, :through => :reviews
  #has_many :categories, :through => :products
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

end
