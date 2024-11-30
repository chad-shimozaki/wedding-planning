class CreateInvites < ActiveRecord::Migration[7.1]
  def change
    create_table :invites do |t|
      t.integer :people_id

      t.timestamps
    end
  end
end
