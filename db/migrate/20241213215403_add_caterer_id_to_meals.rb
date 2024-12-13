class AddCatererIdToMeals < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :caterer_id, :integer
  end
end
