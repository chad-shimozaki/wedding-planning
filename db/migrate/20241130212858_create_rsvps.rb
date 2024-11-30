class CreateRsvps < ActiveRecord::Migration[7.1]
  def change
    create_table :rsvps do |t|
      t.integer :invite_id
      t.integer :event_id
      t.integer :people_id

      t.timestamps
    end
  end
end
