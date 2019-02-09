class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction_amount

  def initialize (discount = 0)
    @total = 0
    @discount = discount
    @items= []
    @last_transaction_amount = 0
  end

  def add_item(title, cost, quantity = 1)
    self.last_transaction_amount = 0
    self.total += cost * quantity
    self.last_transaction_amount += cost * quantity
    counter = 0
    until counter == quantity
      @items << title
      counter += 1
    end
  end

  def apply_discount
    if self.discount > 0
      self.total = self.total * ((100 - discount)* 0.01)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last_transaction_amount
    @items.pop
  end
end
