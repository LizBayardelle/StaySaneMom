class AddFieldsToFreebies < ActiveRecord::Migration[5.2]
  def change
    add_column :freebies, :top_question, :string
    add_column :freebies, :main_heading, :string
    add_column :freebies, :main_subheading, :string
    add_column :freebies, :t1_short, :string
    add_column :freebies, :t1_name, :string
    add_column :freebies, :t1_title, :string
    add_column :freebies, :t1_long, :string
    add_column :freebies, :wyg1, :string
    add_column :freebies, :wyg2, :string
    add_column :freebies, :wyg3, :string
    add_column :freebies, :outcome, :string
  end
end
