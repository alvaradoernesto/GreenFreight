class CreatePickings < ActiveRecord::Migration[6.0]
  def change
    create_table :pickings do |t|

      t.timestamps
    end
  end
end
