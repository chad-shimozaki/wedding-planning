class Hotel < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "hotel_id", dependent: :nullify
  belongs_to :neighborhood, required: true, class_name: "Neighborhood", foreign_key: "neighborhood_id"
  validates :name, presence: true
  validates :name, uniqueness: true
end
