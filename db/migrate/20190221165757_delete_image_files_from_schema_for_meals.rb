class DeleteImageFilesFromSchemaForMeals < ActiveRecord::Migration[5.2]
  def change
    remove_column :meals, :image_file_name
    remove_column :meals, :image_content_type
    remove_column :meals, :image_file_size
    remove_column :meals, :image_updated_at
  end
end
