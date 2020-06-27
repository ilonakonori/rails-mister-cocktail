class Dose < ApplicationRecord
  belongs_to :cocktails
  belongs_to :ingredients
  validates :description, presence: true, uniqueness: true
  validates :cocktail, presence: true, uniqueness: true
end
