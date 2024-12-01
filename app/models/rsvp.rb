class Rsvp < ApplicationRecord
  belongs_to :people, required: true, class_name: "Person", foreign_key: "people_id"
  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id"
  belongs_to :invite, required: true, class_name: "Invite", foreign_key: "invite_id"
end
