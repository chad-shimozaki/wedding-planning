class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :website
      t.string :address
      t.float :lat
      t.float :lng
      t.boolean :contacted
      t.boolean :chosen
      t.boolean :block_discount
      t.integer :minimum_rooms
      t.integer :neighborhood_id
      t.text :price_options
      t.text :notes
      t.string :contact_name
      t.float :final_price

      t.timestamps
    end
  end
end
