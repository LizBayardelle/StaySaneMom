# frozen_string_literal: true
# This migration comes from spree (originally 20170422134804)

class AddRolesUniqueConstraints < ActiveRecord::Migration[5.0]
  def change
    # create_table :spree_roles_users do |t|
    #    t.integer :role_id
    #    t.integer :user_id
    #    t.timestamps precision: 6
    #  end
    #
    # add_index :spree_roles, :name, unique: true
    # add_index :spree_roles_users, [:user_id, :role_id], unique: true
  end
end
