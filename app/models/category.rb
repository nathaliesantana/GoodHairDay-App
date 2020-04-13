class Category < ApplicationRecord
    has_many :products
    has_many :reviews, :through => :products
    validates :name, presence: true
end
