class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :users, :through => :reviews
  before_save :downcase_fields

   def downcase_fields
      self.name.downcase!
      self.brand.downcase!
   end

end
