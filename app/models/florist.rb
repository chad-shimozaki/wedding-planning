# == Schema Information
#
# Table name: florists
#
#  id              :bigint           not null, primary key
#  address         :string
#  chosen          :boolean
#  contact_email   :string
#  contact_name    :string
#  contacted       :boolean
#  deposit         :string
#  final_payment   :boolean
#  final_price     :float
#  lat             :float
#  lng             :float
#  met_with        :boolean
#  name            :string
#  notes           :text
#  paid_deposit    :boolean
#  pdf             :string
#  photo_url       :string
#  price_options   :text
#  signed_contract :boolean
#  website         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#
class Florist < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "florist_id", dependent: :nullify
  belongs_to :neighborhood, required: true, class_name: "Neighborhood", foreign_key: "neighborhood_id"
  validates :name, uniqueness: true
end
