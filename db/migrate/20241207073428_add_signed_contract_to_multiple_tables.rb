class AddSignedContractToMultipleTables < ActiveRecord::Migration[7.1]
  def change
    %i[caterers coordinators djs florists lighting_production_companies photographers transportation_companies venues].each do |table|
      add_column table, :signed_contract, :boolean
    end
  end
end
