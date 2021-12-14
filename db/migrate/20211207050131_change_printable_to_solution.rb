class ChangePrintableToSolution < ActiveRecord::Migration[5.2]
  def change
    rename_table :printables, :solutions
  end
end
