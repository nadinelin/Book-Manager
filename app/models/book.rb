class Book < ApplicationRecord
  has_and_belongs_to_many :spells
 
  validates_presence_of :name
  validates_length_of :name, maximum: 70
  
  validates :name, uniqueness: true
  validates_uniqueness_of :name, :case_sensitive => false
  

  

  def spell_count
      spells.select('name').count
  end
  

  def spell_display
      arr = []
      arr = spells      
      return arr
  end
  
  def all_spells
      arr = []   
      arr = Spell.all
      return arr.length
  end

    
end
