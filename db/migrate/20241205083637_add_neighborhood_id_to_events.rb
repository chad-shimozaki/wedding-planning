class AddNeighborhoodIdToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :neighborhood_id, :integer
  end
end
