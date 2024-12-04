# == Schema Information
#
# Table name: cuisines
#
#  id             :bigint           not null, primary key
#  caterers_count :integer
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Cuisine < ApplicationRecord
  has_many  :caterers, class_name: "Caterer", foreign_key: "cuisine_id", dependent: :nullify
end
