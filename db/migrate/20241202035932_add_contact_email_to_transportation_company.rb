class AddContactEmailToTransportationCompany < ActiveRecord::Migration[7.1]
  def change
    add_column :transportation_companies, :contact_email, :string
  end
end
