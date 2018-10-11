require "pry"

class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity=1)
    self.last_transaction = price * quantity
    self.total += self.last_transaction
    self.items.fill(title, self.items.size, quantity)
  end

  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else
      self.total *= (100.00-discount)/100.00
      return "After the discount, the total comes to $#{self.total.to_i}."
    end
    #binding.pry
    #{}""
  end

  def void_last_transaction
    self.total -= self.last_transaction
    self.last_transaction -= self.last_transaction
  end

end
