class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.string :name
      t.string :email
      t.string :category
      t.text :idea
      t.boolean :prev_published, default: false
      t.boolean :terms, default: false
      t.text :comments
      t.boolean :responded, default: false
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
