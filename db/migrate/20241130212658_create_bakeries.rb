class CreateBakeries < ActiveRecord::Migration[7.1]
  def change
    create_table :bakeries do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.string :website
      t.boolean :contacted
      t.boolean :tried
      t.boolean :chosen
      t.string :contact_name
      t.text :price_options
      t.string :photo_url
      t.text :notes
      t.string :pdf
      t.float :deposit
      t.float :final_price
      t.integer :neighborhood_id

      t.timestamps
    end
  end
end
