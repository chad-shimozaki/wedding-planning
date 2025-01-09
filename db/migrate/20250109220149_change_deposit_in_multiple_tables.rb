class ChangeDepositInMultipleTables < ActiveRecord::Migration[7.1]
  def change
    %i[bakeries caterers coordinators florists lighting_production_companies photographers transportation_companies venues].each do |table|
      change_column table, :deposit, :string
    end
  end
end
