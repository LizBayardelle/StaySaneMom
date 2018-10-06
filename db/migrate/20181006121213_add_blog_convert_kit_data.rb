class AddBlogConvertKitData < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :convertkit_data_form_toggle, :string
    add_column :blogs, :convertkit_href, :string
  end
end
