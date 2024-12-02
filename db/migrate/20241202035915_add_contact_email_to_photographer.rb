class AddContactEmailToPhotographer < ActiveRecord::Migration[7.1]
  def change
    add_column :photographers, :contact_email, :string
  end
end
