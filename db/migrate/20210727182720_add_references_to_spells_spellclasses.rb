class AddReferencesToSpellsSpellclasses < ActiveRecord::Migration[6.1]
  def change
      add_foreign_key :spellclasses_spells, :spellclasses, column: :spellclass_id, primary_key: "id" 
      add_foreign_key :spellclasses_spells, :spells, column: :spell_id, primary_key: "id"
  end
end
