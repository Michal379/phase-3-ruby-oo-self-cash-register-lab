class CashRegister
    attr_accessor :total, :employee_discount
  
    def initialize(employee_discount = 0)
      @total = 0
      @employee_discount = employee_discount
      @items = []
      @last_transaction = 0
    end
  
    def calculate_discounted_total
      @total - (@total * (@employee_discount / 100.0))
    end
  
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      quantity.times { @items << title }
      @last_transaction = price * quantity
    end
  
    def apply_discount
      if @employee_discount > 0
        discount_amount = (@total * (@employee_discount / 100.0)).to_i
        @total -= discount_amount
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      @total -= @last_transaction
    end
  
    def items
      @items
    end
  
    def discount
      @employee_discount
    end
  end
  