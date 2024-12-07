class AddSignedContractToBakeries < ActiveRecord::Migration[7.1]
  def change
    add_column :bakeries, :signed_contract, :boolean
  end
end
