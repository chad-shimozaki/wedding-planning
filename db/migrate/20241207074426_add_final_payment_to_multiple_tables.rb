class AddFinalPaymentToMultipleTables < ActiveRecord::Migration[7.1]
  def change
    %i[bakeries caterers coordinators djs florists lighting_production_companies photographers transportation_companies venues].each do |table|
      add_column table, :final_payment, :boolean
    end
  end
end
