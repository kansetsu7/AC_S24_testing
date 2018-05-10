class Cart

  PRICE = 100

  def add(items)
    @order_items = items.map { |key, val| val }
  end

  def calculate
    total = 0

    @order_items.each do |item|
      total += item * PRICE
    end

    total
  end

end