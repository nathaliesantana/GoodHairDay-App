class User < ApplicationRecord
    has_many :products
    has_many :reviews
    has_many :categories, through: :products
    has_secure_password
end
