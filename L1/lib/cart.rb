class Cart

  PRICE = 100

  def add(items)
    @order_items = items.map { |key, val| val }
  end

  def calculate
    total = 0

    @order_items.delete_if { |quantity| quantity == 0 }
    
    return @order_items.first * PRICE if @order_items.size == 1  

    if @order_items[0] > @order_items[1]
      return (@order_items[1] * 2 * 0.95 + (@order_items[0] - @order_items[1])) * PRICE
    else
      return (@order_items[0] * 2 * 0.95 + (@order_items[1] - @order_items[0])) * PRICE
    end
  end

end