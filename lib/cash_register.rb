class CashRegister
attr_accessor :total, :discount, :items

    def initialize(discount=nil) #disc is nil, different than 0
      @total = 0
      @discount = discount
      @items= []
    end

    def add_item(title, price, quantity=1)
      @title, @price, @quantity = title, price, quantity
        self.total += (price * quantity)

        quantity.times do #once quantity is established, put it in a times loop
          items << title #with each loop, the title is added to the cart
        end
    end

    def apply_discount
      if @discount == nil
        "There is no discount to apply."
      else
        @total -= (@total * @discount/100)
        "After the discount, the total comes to $#{@total}."
      end
    end

    def void_last_transaction
      last_transaction = @price * @quantity
      @total -= last_transaction
    end
end
