class AddIndexToSpellsName < ActiveRecord::Migration[6.1]
  def change
      add_index :spells, :name, unique: true
  end
end
