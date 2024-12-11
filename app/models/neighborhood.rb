# == Schema Information
#
# Table name: neighborhoods
#
#  id         :bigint           not null, primary key
#  name       :string
#  photo_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Neighborhood < ApplicationRecord
  has_many  :caterers, class_name: "Caterer", foreign_key: "neighborhood_id", dependent: :nullify
  has_many  :bakeries, class_name: "Bakery", foreign_key: "neighborhood_id", dependent: :nullify
  has_many  :florists, class_name: "Florist", foreign_key: "neighborhood_id", dependent: :nullify
  has_many  :hotels, class_name: "Hotel", foreign_key: "neighborhood_id", dependent: :nullify
  has_many  :transportation_companies, class_name: "TransportationCompany", foreign_key: "neighborhood_id", dependent: :nullify
  has_many  :venues, class_name: "Venue", foreign_key: "neighborhood_id", dependent: :nullify
end
