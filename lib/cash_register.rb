require 'pry'

class CashRegister

  def initialize(*discount)
    @total = 0
    discount[0] ? @discount = discount[0] : @discount = 0
    @items = []
  end

  attr_accessor :total, :discount, :title, :price, :quantity, :items

def total
  @total
end

def add_item(title, price, *quantity)
  if quantity[0]
    @total += price * quantity[0]
    quantity[0].times do
      @items << title
    end
  else
    @total += price
    @items << title
  end

  @price = price
end

def apply_discount
  if @discount == 0
    "There is no discount to apply."
  else
    @total = @total.to_f - (@total.to_f * @discount.to_f/100.0)
    "After the discount, the total comes to $#{@total.to_i}."
  end
end

def items
  @items
end

def void_last_transaction
  @total -= @price
end

end
