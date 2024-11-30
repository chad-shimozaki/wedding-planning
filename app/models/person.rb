class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :invites, class_name: "Invite", foreign_key: "people_id", dependent: :destroy
  has_many  :rsvps, class_name: "Rsvp", foreign_key: "people_id", dependent: :destroy
  has_many :events, through: :rsvps, source: :event
  validates :long_list, presence: true
end
