class Cart

  PRICE = 100

  def add(items)
    @order_items = items.map { |key, val| val }
  end

  def calculate

    @order_items.delete_if { |quantity| quantity == 0 }
    
    return @order_items.first * PRICE if @order_items.size == 1  

    total = 0
    discounts = [0.95, 0.9, 0.85, 0.8]

    loop do
      num_of_vol = @order_items.size

      if num_of_vol == 1
        total += @order_items.first * PRICE
        break
      else
        total += num_of_vol * PRICE * discounts[num_of_vol - 2]
      end

      @order_items = @order_items.map { |quantity| quantity - 1 }
      @order_items.delete_if { |quantity| quantity == 0 }

      break if @order_items.empty?
    end

    total
  end

end