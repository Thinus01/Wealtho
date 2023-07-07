class AddCreatedAtToCategories < ActiveRecord::Migration[7.0]
  def change
    change_column_default :categories, :created_at, -> { 'CURRENT_TIMESTAMP' }
  end
end
