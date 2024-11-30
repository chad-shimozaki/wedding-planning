class CreateVenues < ActiveRecord::Migration[7.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.string :contact_name
      t.integer :neighborhood_id
      t.string :capacity
      t.string :venue_type
      t.text :price_options
      t.string :website
      t.string :photo_url
      t.string :pdf
      t.boolean :contacted
      t.boolean :visited
      t.boolean :chosen
      t.float :final_price
      t.integer :events_count

      t.timestamps
    end
  end
end
