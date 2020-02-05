class AddStatusToApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :applications, :status, :string, :default => "pending"
  end
end
