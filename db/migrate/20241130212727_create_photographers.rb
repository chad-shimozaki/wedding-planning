class CreatePhotographers < ActiveRecord::Migration[7.1]
  def change
    create_table :photographers do |t|
      t.string :name
      t.string :website
      t.string :photo_url
      t.boolean :contacted
      t.boolean :chosen
      t.text :price_options
      t.float :deposit
      t.text :notes
      t.float :final_price

      t.timestamps
    end
  end
end
