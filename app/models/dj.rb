class Dj < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "dj_id", dependent: :nullify
  validates :name, presence: true
  validates :name, uniqueness: true
end
