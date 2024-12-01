class Caterer < ApplicationRecord
  validates :address, presence: true
  belongs_to :cuisine, required: true, class_name: "Cuisine", foreign_key: "cuisine_id", counter_cache: true
  belongs_to :neighborhood, required: true, class_name: "Neighborhood", foreign_key: "neighborhood_id"
  has_many :events, through: :meals, source: :event
  validates :name, presence: true
  validates :name, uniqueness: true
end
