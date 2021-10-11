class Spellclass < ApplicationRecord
  has_and_belongs_to_many :spells
  
  validates_presence_of :name

end
