class AddContactNameToCoordinators < ActiveRecord::Migration[7.1]
  def change
    add_column :coordinators, :contact_name, :string
  end
end
