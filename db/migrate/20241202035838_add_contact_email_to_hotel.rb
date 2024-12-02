class AddContactEmailToHotel < ActiveRecord::Migration[7.1]
  def change
    add_column :hotels, :contact_email, :string
  end
end
