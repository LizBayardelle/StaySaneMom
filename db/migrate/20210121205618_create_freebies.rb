class CreateFreebies < ActiveRecord::Migration[5.2]
  def change
    create_table :freebies do |t|
      t.string :name
      t.string :short_description
      t.string :convertkit_url
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
