class CreateTruckLoadCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :truck_load_categories do |t|
      t.references :truck, null: false, foreign_key: true
      t.references :load_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
