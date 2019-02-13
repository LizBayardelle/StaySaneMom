class ChangeColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :blogs, :freebie_type, :string, default: "None"
    rename_column :capsules, :date, :capsule_date
  end
end
