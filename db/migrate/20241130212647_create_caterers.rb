class CreateCaterers < ActiveRecord::Migration[7.1]
  def change
    create_table :caterers do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.string :website
      t.string :photo_url
      t.string :pdf
      t.boolean :contacted
      t.boolean :tried
      t.boolean :chosen
      t.string :contact_name
      t.text :price_options
      t.integer :cuisine_id
      t.boolean :preferred
      t.text :notes
      t.float :deposit
      t.float :final_price
      t.integer :neighborhood_id

      t.timestamps
    end
  end
end
