class RecipeFood < ApplicationRecord
  belongs_to :food, optional: true
  belongs_to :recipe, optional: true

  validates :quantity, numericality: { greater_than: 0 }
end
