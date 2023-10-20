class CreateCategoriesQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_quotes do |t|
      t.references :quote, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
