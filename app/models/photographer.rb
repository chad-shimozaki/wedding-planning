# == Schema Information
#
# Table name: photographers
#
#  id            :bigint           not null, primary key
#  chosen        :boolean
#  contact_email :string
#  contacted     :boolean
#  deposit       :float
#  final_price   :float
#  name          :string
#  notes         :text
#  photo_url     :string
#  price_options :text
#  website       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Photographer < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "photographer_id", dependent: :nullify
  validates :name, presence: true
  validates :name, uniqueness: true
end
