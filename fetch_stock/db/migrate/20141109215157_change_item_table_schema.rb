class ChangeItemTableSchema < ActiveRecord::Migration
  def change
    rename_column :items, :type, :stock_type
  end
end
