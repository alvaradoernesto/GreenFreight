class CreateFreights < ActiveRecord::Migration[6.0]
  def change
    create_table :freights do |t|
      t.string :start_point
      t.string :end_point
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.float :price
      t.float :capacity
      t.float :distance
      t.float :emissions
      t.references :truck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
