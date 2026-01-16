class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.integer :current_stock

      t.timestamps
    end
  end
end
