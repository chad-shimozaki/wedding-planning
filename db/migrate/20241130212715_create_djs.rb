class CreateDjs < ActiveRecord::Migration[7.1]
  def change
    create_table :djs do |t|
      t.string :name
      t.string :website
      t.string :photo_url
      t.string :pdf
      t.boolean :contacted
      t.boolean :chosen
      t.text :price_options
      t.text :notes
      t.float :deposit
      t.float :final_price

      t.timestamps
    end
  end
end
