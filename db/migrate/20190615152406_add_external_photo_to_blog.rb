class AddExternalPhotoToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :photo_url, :string
    add_column :blogs, :photo_external, :boolean, default: false
  end
end
