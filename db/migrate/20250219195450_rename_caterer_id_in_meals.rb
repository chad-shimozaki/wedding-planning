class RenameCatererIdInMeals < ActiveRecord::Migration[7.1]
  def change
    rename_column :meals, :caterer_id, :caterer_1_id
  end
end
