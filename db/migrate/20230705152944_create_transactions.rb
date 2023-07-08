class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_name
      t.decimal :transaction_price, precision: 8, scale: 2
      t.references :category, foreign_key: true

      t.timestamps
    end

    add_column :transactions, :category_name, :string
  end
end
