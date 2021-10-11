class CreateSpells < ActiveRecord::Migration[6.1]
  def change
    create_table :spells do |t|
      t.string :name, limit: 70, null: false
      t.integer :level
      t.string :school
      t.boolean :concentration
      t.string :description, limit: 4096

      t.timestamps
    end
  end
end
