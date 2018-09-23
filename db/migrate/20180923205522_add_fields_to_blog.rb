class AddFieldsToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :cta_read_more, :string, default: "Read More"
    add_column :blogs, :cta_pdf, :string, default: "Get My Free PDF"
    add_column :blogs, :cta_video, :string, default: "Watch the Video"
    remove_column :blogs, :cta
  end
end
