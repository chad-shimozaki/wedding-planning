class AddContactEmailToCaterer < ActiveRecord::Migration[7.1]
  def change
    add_column :caterers, :contact_email, :string
  end
end
