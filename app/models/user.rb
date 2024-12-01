class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many  :invites, class_name: "Invite", foreign_key: "user_id", dependent: :destroy
  has_many  :rsvps, class_name: "Rsvp", foreign_key: "user_id", dependent: :destroy
  has_many :events, through: :rsvps, source: :event
  validates :long_list, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
