class AddContactEmailToFlorist < ActiveRecord::Migration[7.1]
  def change
    add_column :florists, :contact_email, :string
  end
end
