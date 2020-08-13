class Removefieldsfromloads < ActiveRecord::Migration[6.0]
  def change
    remove_column :loads, :start_point
    remove_column :loads, :end_point
  end
end
