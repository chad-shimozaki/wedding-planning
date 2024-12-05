class AddUserIdToInvites < ActiveRecord::Migration[7.1]
  def change
    add_column :invites, :user_id, :integer
  end
end
