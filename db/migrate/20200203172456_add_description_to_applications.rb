class AddDescriptionToApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :applications, :description, :string
  end
end
