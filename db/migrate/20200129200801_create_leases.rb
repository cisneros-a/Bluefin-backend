class CreateLeases < ActiveRecord::Migration[6.0]
  def change
    create_table :leases do |t|
      t.references :landlord, references: :users, null: false, foreign_key: { to_table: :users}
      t.references :tenant, references: :users, null: false, foreign_key: { to_table: :users}
      t.references :property, null: false, foreign_key: true
      t.string :lease_start_date
      t.string :lease_end_date
      t.boolean :active

      t.timestamps
    end
  end
end
