class AddNameToCuisines < ActiveRecord::Migration[7.1]
  def change
    add_column :cuisines, :name, :string
  end
end
