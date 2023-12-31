class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.integer :author_id
      t.references :user, foreign_key: true
      t.string :name
      t.float :amount
      
      t.timestamps
    end
  end
end
