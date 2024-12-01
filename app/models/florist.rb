class Florist < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "florist_id", dependent: :nullify
  belongs_to :neighborhood, required: true, class_name: "Neighborhood", foreign_key: "neighborhood_id"
  belongs_to :neighborhood, required: true, class_name: "Neighborhood", foreign_key: "neighborhood_id"
  validates :name, uniqueness: true
end
