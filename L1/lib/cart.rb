class Cart

  PRICE = 100

  def add(items)
    @order_items = items.map { |key, val| val }
  end

  def calculate

    @order_items.delete_if { |quantity| quantity == 0 }
    
    return @order_items.first * PRICE if @order_items.size == 1  

    total = 0
    loop do

      case @order_items.size
      when 1  # 1 vol -> no discount
        total += @order_items.first * PRICE
        break
      when 2  # 2 different books -> 5% off
        total += 2 * PRICE * 0.95
      when 3  # 3 different books -> 10% off
        total += 3 * PRICE * 0.9
      end

      @order_items = @order_items.map { |quantity| quantity - 1 }
      @order_items.delete_if { |quantity| quantity == 0 }

      break if @order_items.empty?
    end

    total
  end

end