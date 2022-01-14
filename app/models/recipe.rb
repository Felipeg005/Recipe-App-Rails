class Recipe < ApplicationRecord
  has_many :recipe_foods, foreign_key: 'recipe_id'
  belongs_to :user, optional: true

  validates :name, presence: true, length: { maximum: 200 }
  validates :preparation_time, numericality: { greater_than: 0 }
  validates :cooking_time, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 450 }
end
