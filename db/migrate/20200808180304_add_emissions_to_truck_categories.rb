class AddEmissionsToTruckCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :truck_categories, :emissions, :float
  end
end
