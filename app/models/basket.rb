class Basket < ApplicationRecord
  belongs_to :basket_status
  has_many :basket_items
  before_create :set_basket_status
  before_save :update_subtotal

  def subtotal
    basket_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private
  
  def set_basket_status
    self.basket_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
