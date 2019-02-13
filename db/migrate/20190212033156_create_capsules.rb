class CreateCapsules < ActiveRecord::Migration[5.2]
  def change
    create_table :capsules do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.date :date
      t.boolean :active, default: true
      t.boolean :reminder_email, default: true
      t.text :comments

      t.timestamps
    end
  end
end
