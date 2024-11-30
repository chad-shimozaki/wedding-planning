class CreateLightingProductionCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :lighting_production_companies do |t|
      t.string :name
      t.string :website
      t.boolean :contacted
      t.boolean :chosen
      t.text :price_options
      t.text :notes
      t.text :deposit
      t.string :contact_name
      t.float :final_price

      t.timestamps
    end
  end
end
