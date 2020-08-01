class CreateTrucks < ActiveRecord::Migration[6.0]
  def change
    create_table :trucks do |t|
      t.float :price_per_km
      t.float :capacity
      t.references :user, null: false, foreign_key: true
      t.references :truck_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
