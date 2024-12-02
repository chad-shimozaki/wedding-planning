class AddContactEmailToVenue < ActiveRecord::Migration[7.1]
  def change
    add_column :venues, :contact_email, :string
  end
end
