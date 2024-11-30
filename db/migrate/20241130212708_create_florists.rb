class CreateFlorists < ActiveRecord::Migration[7.1]
  def change
    create_table :florists do |t|
      t.string :name
      t.string :website
      t.string :address
      t.float :lat
      t.float :lng
      t.boolean :contacted
      t.boolean :chosen
      t.text :price_options
      t.text :notes
      t.float :deposit
      t.string :contact_name
      t.float :final_price
      t.integer :neighborhood_id

      t.timestamps
    end
  end
end
