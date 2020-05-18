class UpdateBasketForeignKey < ActiveRecord::Migration[5.2]
  def change
     # remove the old foreign_key
     remove_foreign_key :baskets, :basket_statuses

     # add the new foreign_key
     add_foreign_key :baskets, :basket_statuses, on_delete: :cascade
   end
 end
