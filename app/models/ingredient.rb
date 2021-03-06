class Ingredient < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_attached_file :image, styles: { thumb: "100x100" }, default_url: "missings/ingredient.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients
end
