class AddPaidDepositToMultipleTables < ActiveRecord::Migration[7.1]
  def change
    %i[bakeries caterers coordinators djs florists lighting_production_companies photographers transportation_companies venues].each do |table|
      add_column table, :paid_deposit, :boolean
    end
  end
end
