# == Schema Information
#
# Table name: photographers
#
#  id              :bigint           not null, primary key
#  chosen          :boolean
#  contact_email   :string
#  contacted       :boolean
#  deposit         :string
#  final_payment   :boolean
#  final_price     :float
#  instagram       :string
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
#
class Photographer < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "photographer_id", dependent: :nullify
  validates :name, presence: true
  validates :name, uniqueness: true
end
