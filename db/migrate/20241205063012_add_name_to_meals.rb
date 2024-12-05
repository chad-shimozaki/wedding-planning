class AddNameToMeals < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :name, :string
  end
end
