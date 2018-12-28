class AddSmNeedsApprovalToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sm_needs_approval, :boolean, default: true
  end
end
