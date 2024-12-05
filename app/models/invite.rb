# == Schema Information
#
# Table name: invites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Invite < ApplicationRecord
  belongs_to :people, required: true, class_name: "Person", foreign_key: "people_id", counter_cache: true
  has_many  :rsvps, class_name: "Rsvp", foreign_key: "invite_id", dependent: :nullify
end
