class Event < ApplicationRecord
  belongs_to :venue, required: true, class_name: "Venue", foreign_key: "venue_id", counter_cache: true
  belongs_to :bakery, class_name: "Bakery", foreign_key: "bakery_id"
  belongs_to :florist, class_name: "Florist", foreign_key: "florist_id"
  belongs_to :dj, class_name: "Dj", foreign_key: "dj_id"
  belongs_to :photographer, class_name: "Photographer", foreign_key: "photographer_id"
  belongs_to :coordinator, class_name: "Coordinator", foreign_key: "coordinator_id"
  belongs_to :transportation_company, class_name: "TransportationCompany", foreign_key: "transportation_company_id"
  belongs_to :lighting_production_company, class_name: "LightingProductionCompany", foreign_key: "lighting_production_company_id"
  belongs_to :hotel, class_name: "Hotel", foreign_key: "hotel_id"
  has_many  :meals, class_name: "Meal", foreign_key: "event_id", dependent: :nullify
  has_many  :rsvps, class_name: "Rsvp", foreign_key: "event_id", dependent: :nullify
  has_many :caterers, through: :meals, source: :caterer
  has_many :attendees, through: :rsvps, source: :people
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :chronological_order, presence: true
end
