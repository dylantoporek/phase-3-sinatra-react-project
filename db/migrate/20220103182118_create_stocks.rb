class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.integer :quantity
      t.integer :store_id
      t.integer :item_id
    end
  end
end
