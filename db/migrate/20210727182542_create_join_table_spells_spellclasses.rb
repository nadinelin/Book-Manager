class CreateJoinTableSpellsSpellclasses < ActiveRecord::Migration[6.1]
  def change
    create_join_table :spells, :spellclasses do |t|
      # t.index [:spell_id, :spellclass_id]
      t.index [:spellclass_id, :spell_id], unique: true
    end
  end
end
