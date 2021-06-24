class AddMailerLiteToFreebies < ActiveRecord::Migration[5.2]
  def change
    add_column :freebies, :ml_id, :string
    add_column :freebies, :ml_submit_code, :string
    add_column :freebies, :after_download_url, :string
    add_column :freebies, :ml_img_track_url, :string
  end
end
