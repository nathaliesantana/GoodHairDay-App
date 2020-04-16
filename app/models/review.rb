class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  accepts_nested_attributes_for :product
  validates :rating, presence: true
end
