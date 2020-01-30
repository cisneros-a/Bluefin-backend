class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :rent
      t.string :bedrooms
      t.string :bathrooms
      t.string :sqft
      t.boolean :availability
      t.string :available_date
      t.string :description
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
