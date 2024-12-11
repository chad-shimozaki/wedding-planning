# == Schema Information
#
# Table name: hotels
#
#  id              :bigint           not null, primary key
#  address         :string
#  block_discount  :boolean
#  chosen          :boolean
#  contact_email   :string
#  contact_name    :string
#  contacted       :boolean
#  final_price     :float
#  lat             :float
#  lng             :float
#  minimum_rooms   :integer
#  name            :string
#  notes           :text
#  pdf             :string
#  photo_url       :string
#  price_options   :text
#  signed_contract :boolean
#  website         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#
class Hotel < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "hotel_id", dependent: :nullify
  belongs_to :neighborhood, required: true, class_name: "Neighborhood", foreign_key: "neighborhood_id"
  validates :name, presence: true
  validates :name, uniqueness: true
end
