
class CashRegister

  attr_accessor :items, :discount, :total, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount #initialize reps the creation of the cash register object
    @items = []
  end

  def add_item(title, amount, quantity=1)

  	#takes in the self with an attribute of total then it takes the amount and times that with the quantity 
    self.total += amount * quantity
    #takes the quantity and applies a times loop
    quantity.times do
    	#which pushs the title into the items array
      items << title
    end
    self.last_transaction = amount * quantity # sets last transaction to equal the amount times the quantity
  end

  def apply_discount
    if discount != 0 #check to see if discount DOES NOT equal 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i #to f rounds number to_i turns into interger
      "After the discount, the total comes to $#{self.total}." #returns the total from the line above
    else
      "There is no discount to apply." # if there is a discount it will return this string
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction #takes the self.total from above method apply_discount and reassigns
    #it a value equal to self.total - self.last_transaction
  end
end