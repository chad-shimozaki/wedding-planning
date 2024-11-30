class CreateCuisines < ActiveRecord::Migration[7.1]
  def change
    create_table :cuisines do |t|
      t.integer :caterers_count

      t.timestamps
    end
  end
end
