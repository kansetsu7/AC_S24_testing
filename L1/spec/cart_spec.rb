require_relative '../lib/cart.rb'

describe Cart do

  it '買第一集1本' do
    @cart = Cart.new
    @cart.add({ "1st": 1, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0 })
    expect(@cart.calculate).to eq(100)
  end

  it '買第一集3本' do
    @cart = Cart.new
    @cart.add({ "1st": 3, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0 })
    expect(@cart.calculate).to eq(300)
  end

end