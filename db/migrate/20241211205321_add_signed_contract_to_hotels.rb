class AddSignedContractToHotels < ActiveRecord::Migration[7.1]
  def change
    add_column :hotels, :signed_contract, :boolean
  end
end
