class Invite < ApplicationRecord
  belongs_to :people, required: true, class_name: "Person", foreign_key: "people_id", counter_cache: true
  has_many  :rsvps, class_name: "Rsvp", foreign_key: "invite_id", dependent: :nullify
end
