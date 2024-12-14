# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  attendee               :boolean
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  group_general          :string
#  group_specific         :string
#  invitee                :boolean
#  invites_count          :integer
#  long_list              :boolean
#  notes                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string
#  tier                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :set_admin_for_specific_email


  has_many  :invites, class_name: "Invite", foreign_key: "user_id", dependent: :destroy
  has_many  :rsvps, class_name: "Rsvp", foreign_key: "user_id", dependent: :destroy
  has_many :events, through: :rsvps, source: :event

  def admin?
    self.role == "admin"
  end

  def set_admin_for_specific_email
    if self.email == "chiyashimo.wedding@gmail.com"
      self.role = "admin"
    end
  end
end
