class CreateSalesLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :sales_logs do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.datetime :sold_at

      t.timestamps
    end
  end
end
