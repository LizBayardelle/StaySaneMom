class AddFieldsToSolutions < ActiveRecord::Migration[5.2]
  def change
    add_column :solutions, :long_description, :text
    add_column :solutions, :top_question, :string
    add_column :solutions, :outcome, :string
    add_column :solutions, :wyg1, :string
    add_column :solutions, :wyg2, :string
    add_column :solutions, :wyg3, :string
    add_column :solutions, :outcome_2, :string
  end
end
