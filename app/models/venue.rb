class Venue < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "venue_id", dependent: :nullify
  belongs_to :neighborhood, required: true, class_name: "Neighborhood", foreign_key: "neighborhood_id"
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :address, presence: true
end
