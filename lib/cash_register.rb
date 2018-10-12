require 'pry'

class CashRegister

attr_accessor :discount, :total, :items, :last_transaction



	def initialize(discount = 0) 
		@discount = discount
		@total = 0
	 	@items = []
	 	@last_transaction = 0
	end

 	def discount=(discount)
		@discount = discount
	end

	def total=(total)
		@total = total
	end

	def add_item (items, price, quant = 1)
		self.total += price * quant
		quant.times do
			@items << items
		end
		@last_transaction = price * quant
	end

	def apply_discount
		
		if self.discount > 0
		employee_discount = self.discount.to_f / 100
		new_total = self.total * employee_discount
		self.total -= new_total.to_i
			"After the discount, the total comes to $#{self.total}."
		else @discount = 0
			"There is no discount to apply."
		end
	end

	def void_last_transaction
		self.total -= @last_transaction
	end

end
