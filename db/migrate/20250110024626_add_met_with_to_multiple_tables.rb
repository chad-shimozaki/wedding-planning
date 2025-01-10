class AddMetWithToMultipleTables < ActiveRecord::Migration[7.1]
  def change
    %i[coordinators djs florists lighting_production_companies photographers transportation_companies].each do |table|
      add_column table, :met_with, :boolean
    end
  end
end
