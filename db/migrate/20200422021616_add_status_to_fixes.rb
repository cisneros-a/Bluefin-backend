class AddStatusToFixes < ActiveRecord::Migration[6.0]
  def change
    add_column :fixes, :status, :string, :default => "Unresolved"
  end
end
