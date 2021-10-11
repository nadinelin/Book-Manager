class AddIndexToBooksName < ActiveRecord::Migration[6.1]
  def change
      add_index :books, :name, unique: true
  end
end
