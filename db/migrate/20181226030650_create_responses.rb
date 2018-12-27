class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.boolean :read
      t.boolean :approved
      t.boolean :email
      t.string :name

      t.timestamps
    end
  end
end
