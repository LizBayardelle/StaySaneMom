class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :type
      t.string :from_name
      t.string :from_email
      t.string :subject
      t.text :body
      t.boolean :answered, default: false

      t.timestamps
    end
  end
end
