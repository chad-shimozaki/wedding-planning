class CreateTransportationCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :transportation_companies do |t|
      t.string :name
      t.string :website
      t.boolean :contacted
      t.boolean :chosen
      t.text :price_options
      t.boolean :deposit
      t.text :notes
      t.string :contact_name
      t.float :final_price
      t.integer :neighborhood_id

      t.timestamps
    end
  end
end
