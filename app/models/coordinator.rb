class Coordinator < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "coordinator_id", dependent: :nullify
  validates :name, presence: true
  validates :name, uniqueness: true
end
