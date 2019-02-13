class CreateCapsuleItems < ActiveRecord::Migration[5.2]
  def change
    create_table :capsule_items do |t|
      t.date :item_date
      t.attachment :photo
      t.string :title
      t.text :caption
      t.references :user, foreign_key: true
      t.references :capsule, foreign_key: true

      t.timestamps
    end
  end
end
