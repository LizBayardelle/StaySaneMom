class AddTestimonialToSolutions < ActiveRecord::Migration[5.2]
  def change
    add_column :solutions, :t1_long, :text
    add_column :solutions, :t1_short, :string
    add_column :solutions, :t1_name, :string
    add_column :solutions, :t1_title, :string
  end
end
