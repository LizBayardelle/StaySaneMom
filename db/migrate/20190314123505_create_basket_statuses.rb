class CreateBasketStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :basket_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
