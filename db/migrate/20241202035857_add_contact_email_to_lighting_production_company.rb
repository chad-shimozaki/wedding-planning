class AddContactEmailToLightingProductionCompany < ActiveRecord::Migration[7.1]
  def change
    add_column :lighting_production_companies, :contact_email, :string
  end
end
