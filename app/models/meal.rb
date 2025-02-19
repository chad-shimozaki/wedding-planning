# == Schema Information
#
# Table name: meals
#
#  id           :bigint           not null, primary key
#  name         :string
#  photo_url    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  caterer_1_id :integer
#  caterer_2_id :integer
#  event_id     :integer
#
class Meal < ApplicationRecord
  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id"
  has_many  :foods, class_name: "Food", foreign_key: "meal_id", dependent: :nullify
  has_many :caterers, through: :foods, source: :caterer
  has_many :cuisines, through: :foods, source: :cuisine
end
