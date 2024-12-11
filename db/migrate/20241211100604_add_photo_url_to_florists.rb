class AddPhotoUrlToFlorists < ActiveRecord::Migration[7.1]
  def change
    add_column :florists, :photo_url, :string
  end
end
