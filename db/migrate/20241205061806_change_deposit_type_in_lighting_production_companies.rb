class ChangeDepositTypeInLightingProductionCompanies < ActiveRecord::Migration[7.1]
  def change
    change_column :lighting_production_companies, :deposit, :float, using: 'deposit::double precision'
  end
end
