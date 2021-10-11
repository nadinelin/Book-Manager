class Spell < ApplicationRecord
  has_and_belongs_to_many :books
  has_and_belongs_to_many :spellclasses
  
  validates_presence_of :name
  validates_length_of :name, maximum: 70
  validates :name, uniqueness: true
  validates_presence_of :level
  validates_numericality_of :level, only_integer: true, greater_than: -1, less_than: 10  
  validates_presence_of :school
  validates :concentration, inclusion: [true, false]
  validates_uniqueness_of :name, :case_sensitive => false
  

    
    def class_dis
       arr = []
       arr = spellclasses
        return arr
    end
    
    def con_dis
        if concentration
            return "Yes"
        else 
            return "No"
        end
    end
    
end
