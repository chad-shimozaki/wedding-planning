class AddMealToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :meal_id, :integer
  end
end
