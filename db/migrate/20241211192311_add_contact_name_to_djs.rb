class AddContactNameToDjs < ActiveRecord::Migration[7.1]
  def change
    add_column :djs, :contact_name, :string
  end
end
