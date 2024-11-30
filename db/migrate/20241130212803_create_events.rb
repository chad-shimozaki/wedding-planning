class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :chronological_order
      t.integer :bakery_id
      t.integer :coordinator_id
      t.integer :dj_id
      t.integer :florist_id
      t.integer :hotel_id
      t.integer :lighting_production_company_id
      t.integer :photographer_id
      t.integer :transportation_company_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
