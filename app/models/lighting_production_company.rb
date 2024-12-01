class LightingProductionCompany < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "lighting_production_company_id", dependent: :nullify
  validates :name, presence: true
  validates :name, uniqueness: true
end
