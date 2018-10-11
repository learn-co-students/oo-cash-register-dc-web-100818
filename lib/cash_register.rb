require 'pry'

class CashRegister
    attr_accessor :total, :discount, :title, :price, :quantity, :last_transaction

    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @title = []
      @last_transaction = 0
    end

    def add_item(title, price, quantity = 1)
      self.total += price*quantity
      quantity.times do
         @title << title
      end
      @last_transaction = price*quantity
    end

    def apply_discount
      self.total = self.total - (self.total)* self.discount/100
      if discount > 0
      "After the discount, the total comes to $#{self.total}."
      else
      "There is no discount to apply."
      end
    end

    def items
      self.title
    end

    def void_last_transaction
      self.total -= @last_transaction
    end
end
