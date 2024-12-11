class AddPhotoUrlToMultipleTables < ActiveRecord::Migration[7.1]
  def change
      %i[cuisines events foods hotels lighting_production_companies meals neighborhoods transportation_companies].each do |table|
        add_column table, :photo_url, :string
      end
  end
end
