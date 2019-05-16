require 'rb-readline'
require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_item_amount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_item_amount = 0
  end

  def add_item(title, price, quantity = 1)
    quantity.times do |item|
      self.items << title
    end

    self.total += quantity * price
    self.last_item_amount = price
  end

  def apply_discount
    if discount == 0
      'There is no discount to apply.'
    else
      self.total = self.total - (self.total * (discount / 100.0))
      "After the discount, the total comes to $#{self.total.floor}."
    end
  end

  def void_last_transaction
    self.total -= self.last_item_amount
  end

end

apples = CashRegister.new(20)
apples.add_item('apples', 5.00, 5)
apples.apply_discount
