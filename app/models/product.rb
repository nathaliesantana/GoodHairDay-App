class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :users, :through => :reviews
  before_save :downcase_fields
  validates :name, presence: true
  validates :brand, presence: true
  validates :category_id, presence: true

  def downcase_fields
    self.name.downcase!
    self.brand.downcase!
  end

end
