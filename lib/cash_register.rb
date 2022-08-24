require 'pry'


class CashRegister
    attr_accessor :cash_register, :total ,:discount,:items

    def initialize discount=0
        @cash_register = cash_register
        @total=0
        @discount = discount
        @items=[]
    end

    def add_item title, price, quantity=1
        @title = title
        @price = price
        @quantity = quantity
        @total = total + price * quantity
        if quantity == 1
        @items= @items.push @title
        else
        @items.fill(@title, @items.size, @quantity)
        end
    end

    # def total
    #     if @discount > 0
    #         discount_amount =@price * @discount / 100
    #         total_discount = @total - discount_amount
    #     else
    #         @total
    #     end
    # end

    def apply_discount
        if @discount > 0
            discount_amount =@price * @discount / 100
            @total= @total - discount_amount
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items 
        # @items.push @title     
        # @items.fill(@title, @items.size, @quantity)
        @items = @items

    end

    def void_last_transaction
        @items=@items.uniq
        @items.pop
        if @items.size == 0
            @total= 0
        else
            @total = @total - @price
        end
        @total
    end

end
# binding.pry
# cash_register = CashRegister.new
# cash_register_with_discount = CashRegister.new(20)
# CashRegister.new(20)
# CashRegister.add_item("macbook air", 1000)
# puts CashRegister.apply_discount
# cash_register_with_discount.add_item("macbook air", 1000)
# cash_register_with_discount.apply_discount 