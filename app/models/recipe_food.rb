class RecipeFood < ApplicationRecord
  belongs_to :food, optional: true
  belongs_to :recipe, optional: true
end
