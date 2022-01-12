class Food < ApplicationRecord
  has_many :recipe_foods, foreign_key: 'food_id'
  belongs_to :user, optional: true

  validates :name, presence: true, length: { maximum: 200 }
  validates :measurement_unit, presence: true, length: { maximum: 50 }
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
