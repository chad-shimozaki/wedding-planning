class ChangeDepositTypeInDjs < ActiveRecord::Migration[7.1]
  def change
        change_column :djs, :deposit, :string
  end
end
