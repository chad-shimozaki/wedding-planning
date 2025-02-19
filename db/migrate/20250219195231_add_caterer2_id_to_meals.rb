class AddCaterer2IdToMeals < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :caterer_2_id, :integer
  end
end
