class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.integer :meal_id
      t.integer :caterer_id
      t.integer :cuisine_id

      t.timestamps
    end
  end
end
