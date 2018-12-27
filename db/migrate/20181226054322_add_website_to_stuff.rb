class AddWebsiteToStuff < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :website_name, :string
    add_column :users, :website_url, :string
    add_column :users, :sm_facebook, :string
    add_column :users, :sm_pinterest, :string
    add_column :users, :sm_instagram, :string
    add_column :users, :sm_twitter, :string
    add_column :users, :sm_other, :string
    add_column :users, :sm_youtube, :string
    add_column :users, :sm_email, :string
    add_column :users, :contributor, :boolean, default: false
    add_column :users, :contributor_request, :boolean, default: false
    add_column :users, :sm_approved, :boolean, default: false
  end
end
