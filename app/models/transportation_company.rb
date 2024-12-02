# == Schema Information
#
# Table name: transportation_companies
#
#  id              :bigint           not null, primary key
#  chosen          :boolean
#  contact_email   :string
#  contact_name    :string
#  contacted       :boolean
#  deposit         :boolean
#  final_price     :float
#  name            :string
#  notes           :text
#  price_options   :text
#  website         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#
class TransportationCompany < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "transportation_company_id", dependent: :nullify
  belongs_to :neighborhood, required: true, class_name: "Neighborhood", foreign_key: "neighborhood_id"
  validates :name, presence: true
  validates :name, uniqueness: true
end
