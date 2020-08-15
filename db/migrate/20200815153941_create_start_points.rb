class CreateStartPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :start_points do |t|
      t.string :location
      t.float :latitude
      t.float :longitude
      t.references :load, null: false, foreign_key: true
      t.timestamps
    end
  end
end
