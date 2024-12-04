# == Schema Information
#
# Table name: cuisines
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cuisine < ApplicationRecord
  has_many  :caterers, class_name: "Caterer", foreign_key: "cuisine_id", dependent: :nullify
  has_many  :foods, class_name: "Food", foreign_key: "cuisine_id", dependent: :nullify
  has_many :meals, through: :foods, source: :meal
end
