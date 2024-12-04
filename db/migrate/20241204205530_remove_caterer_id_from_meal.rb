class RemoveCatererIdFromMeal < ActiveRecord::Migration[7.1]
  def change
    remove_column :meals, :caterer_id, :integer
  end
end
