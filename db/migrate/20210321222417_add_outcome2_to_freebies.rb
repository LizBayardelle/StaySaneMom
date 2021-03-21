class AddOutcome2ToFreebies < ActiveRecord::Migration[5.2]
  def change
    add_column :freebies, :outcome_2, :string
  end
end
