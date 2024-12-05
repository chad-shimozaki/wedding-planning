class AddInstagramToPhotographers < ActiveRecord::Migration[7.1]
  def change
    add_column :photographers, :instagram, :string
  end
end
