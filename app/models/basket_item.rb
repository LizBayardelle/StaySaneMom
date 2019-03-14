class BasketItem < ActiveRecord::Base
  belongs_to :variation
  belongs_to :basket

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :variation_present
  validate :basket_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      variation.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def variation_present
    if variation.nil?
      errors.add(:variation, "is not valid or is not active.")
    end
  end

  def basket_present
    if basket.nil?
      errors.add(:basket, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
