# == Schema Information
#
# Table name: meals
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  caterer_id :integer
#  event_id   :integer
#
class Meal < ApplicationRecord
  belongs_to :caterer, required: true, class_name: "Caterer", foreign_key: "caterer_id"
  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id"
end
