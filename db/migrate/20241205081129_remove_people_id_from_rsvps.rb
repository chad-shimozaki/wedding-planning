class RemovePeopleIdFromRsvps < ActiveRecord::Migration[7.1]
  def change
    remove_column :rsvps, :people_id, :integer
  end
end
