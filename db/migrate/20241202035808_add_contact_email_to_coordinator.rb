class AddContactEmailToCoordinator < ActiveRecord::Migration[7.1]
  def change
    add_column :coordinators, :contact_email, :string
  end
end
