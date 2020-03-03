class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.boolean :animal_tested
      t.string :country_of_origin
      t.boolean :paraben
      t.boolean :silicone
      t.boolean :sulfate
      t.integer :rating
      t.text :comment
      t.belongs_to :user, foreign_key: true
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
