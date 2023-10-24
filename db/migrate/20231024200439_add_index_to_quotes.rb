class AddIndexToQuotes < ActiveRecord::Migration[7.0]
  def change
    add_index :quotes, :name
  end
end
