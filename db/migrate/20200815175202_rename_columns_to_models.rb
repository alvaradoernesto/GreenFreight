class RenameColumnsToModels < ActiveRecord::Migration[6.0]
  def change
    rename_column :load_categories, :name, :description
    rename_column :special_requirements, :name, :description
    rename_column :truck_categories, :name, :description
  end
end
