class RemoveCaterersCountFromCuisine < ActiveRecord::Migration[7.1]
  def change
    remove_column :cuisines, :caterers_count, :integer
  end
end
