class AddPdfToMultipleTables < ActiveRecord::Migration[7.1]
  def change
    %i[florists hotels lighting_production_companies transportation_companies].each do |table|
      add_column table, :pdf, :string
    end
  end
end
