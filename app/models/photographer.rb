class Photographer < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "photographer_id", dependent: :nullify
  validates :name, presence: true
  validates :name, uniqueness: true
end
