class AddPdfToPhotographers < ActiveRecord::Migration[7.1]
  def change
    add_column :photographers, :pdf, :string
  end
end
