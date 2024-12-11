# == Schema Information
#
# Table name: foods
#
#  id         :bigint           not null, primary key
#  photo_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  caterer_id :integer
#  cuisine_id :integer
#  meal_id    :integer
#
class Food < ApplicationRecord
  belongs_to :caterer, required: true, class_name: "Caterer", foreign_key: "caterer_id"
  belongs_to :cuisine, required: true, class_name: "Cuisine", foreign_key: "cuisine_id"
  belongs_to :meal, required: true, class_name: "Meal", foreign_key: "meal_id"
end
