# == Schema Information
#
# Table name: rsvps
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  invite_id  :integer
#  user_id    :integer
#
class Rsvp < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id"
  belongs_to :invite, required: true, class_name: "Invite", foreign_key: "invite_id"
end
