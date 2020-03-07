class Category < ApplicationRecord
    has_many :products
    has_many :reviews, through: :products
    has_many :users, through: :products
end
