class CashRegister

  attr_accessor :discount, :total

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(item, price, quantity=nil)
    if quantity != nil
      @total += price.to_f  * quantity
      quantity.times {@items << item}
    else
      @total += price.to_f
      @items << item
    end
  end

  def apply_discount
    if @discount != nil
      @total = @total -  @total * @discount.to_i / 100
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = 0
  end

end
