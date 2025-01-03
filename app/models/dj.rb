# == Schema Information
#
# Table name: djs
#
#  id              :bigint           not null, primary key
#  chosen          :boolean
#  contact_email   :string
#  contact_name    :string
#  contacted       :boolean
#  deposit         :float
#  final_payment   :boolean
#  final_price     :float
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
class Dj < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "dj_id", dependent: :nullify
  validates :name, presence: true
  validates :name, uniqueness: true
end
