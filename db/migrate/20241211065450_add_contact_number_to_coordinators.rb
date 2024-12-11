class AddContactNumberToCoordinators < ActiveRecord::Migration[7.1]
  def change
    add_column :coordinators, :contact_number, :string
  end
end
