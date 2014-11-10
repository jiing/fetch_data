class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :symbol
      t.string :name
      t.string :type
      t.decimal :value
      t.string :coin_type
      t.string :investment_id
      t.string :integer
      t.datetime :time

      t.timestamps
    end
  end
end
