class AddContactEmailToDj < ActiveRecord::Migration[7.1]
  def change
    add_column :djs, :contact_email, :string
  end
end
