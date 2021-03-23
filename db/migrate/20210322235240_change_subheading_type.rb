class ChangeSubheadingType < ActiveRecord::Migration[5.2]
  def change
    change_column :freebies, :main_subheading, :text
  end
end
