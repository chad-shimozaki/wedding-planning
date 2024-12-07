class AddNotesToVenues < ActiveRecord::Migration[7.1]
  def change
    add_column :venues, :notes, :text
  end
end
