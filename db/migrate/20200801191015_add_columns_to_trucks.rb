class AddColumnsToTrucks < ActiveRecord::Migration[6.0]
  def change
    add_column :trucks, :truck_name, :string
    add_column :trucks, :driver_name, :string
    add_column :trucks, :driver_license, :string
    add_column :trucks, :truck_license, :string
  end
end
