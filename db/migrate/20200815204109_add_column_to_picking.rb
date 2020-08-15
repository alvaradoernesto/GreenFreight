class AddColumnToPicking < ActiveRecord::Migration[6.0]
  def change
    add_column :pickings, :load_number, :string
  end
end
