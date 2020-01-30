class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.references :landlord, references: :users, null: false, foreign_key: { to_table: :users}
      t.references :tenant, references: :users, null: false, foreign_key: { to_table: :users}
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
