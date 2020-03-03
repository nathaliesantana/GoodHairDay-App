class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :hair_texture
      t.string :hair_structure
      t.string :scalp_moist

      t.timestamps
    end
  end
end
