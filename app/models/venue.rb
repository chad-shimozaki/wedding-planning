# == Schema Information
#
# Table name: venues
#
#  id              :bigint           not null, primary key
#  address         :string
#  capacity        :string
#  chosen          :boolean
#  contact_email   :string
#  contact_name    :string
#  contacted       :boolean
#  deposit         :float
#  events_count    :integer
#  final_price     :float
#  lat             :float
#  lng             :float
#  name            :string
#  pdf             :string
#  photo_url       :string
#  price_options   :text
#  signed_contract :boolean
#  venue_type      :string
#  visited         :boolean
#  website         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#
class Venue < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "venue_id", dependent: :nullify
  belongs_to :neighborhood, required: true, class_name: "Neighborhood", foreign_key: "neighborhood_id"
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :address, presence: true
end
