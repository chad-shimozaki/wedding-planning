class ChangeDepositTypeInTransportationCompanies < ActiveRecord::Migration[7.1]
  def change
    change_column :transportation_companies, :deposit, :float, using: 'CASE WHEN deposit THEN 1.0 ELSE 0.0 END'
  end
end
