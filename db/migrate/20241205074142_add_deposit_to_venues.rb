class AddDepositToVenues < ActiveRecord::Migration[7.1]
  def change
    add_column :venues, :deposit, :float
  end
end
