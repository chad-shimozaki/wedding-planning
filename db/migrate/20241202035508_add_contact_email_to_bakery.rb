class AddContactEmailToBakery < ActiveRecord::Migration[7.1]
  def change
    add_column :bakeries, :contact_email, :string
  end
end
