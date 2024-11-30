class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.integer :caterer_id
      t.integer :event_id

      t.timestamps
    end
  end
end
