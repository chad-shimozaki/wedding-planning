class AddNameToNeighborhoods < ActiveRecord::Migration[7.1]
  def change
    add_column :neighborhoods, :name, :string
  end
end
