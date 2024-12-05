class AddUserIdToRsvps < ActiveRecord::Migration[7.1]
  def change
    add_column :rsvps, :user_id, :integer
  end
end
