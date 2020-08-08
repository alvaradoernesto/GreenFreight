class CreateLoads < ActiveRecord::Migration[6.0]
  def change
    create_table :loads do |t|
      t.references :user, null: false, foreign_key: true
      t.references :freight, null: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :hour_range
      t.string :start_point
      t.string :end_point
      t.references :load_category, null: true, foreign_key: true
      t.references :special_requirement, null: true, foreign_key: true
      t.integer :weight
      t.integer :volume
      t.string :status
      t.integer :price

      t.timestamps
    end
  end
end
