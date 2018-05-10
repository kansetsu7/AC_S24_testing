require_relative '../lib/cart.rb'

describe Cart do
  before do
    @cart = Cart.new
  end

  context '(1) no discount' do
    it '買第一集1本' do
      @cart.add({ "1st": 1, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(100)
    end

    it '買第一集3本' do
      @cart.add({ "1st": 3, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(300)
    end
  end

  context "(2) 5% off" do

    it '第一集買 1 本、第二集買 1 本' do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(190)
    end

    it '第一集買 2 本、第二集買 2 本' do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(380)      
    end

    it '第一集買 1 本、第二集買 2 本' do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(290) 
    end

    it '第一集買 2 本、第二集買 3 本' do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(480) 
    end

  end

  context "(3) 10% off" do

    it '第一集買 1 本、第二集買 1 本、第三集買 1 本' do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 1, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(270)  # 300*0.9
    end

    it '第一集買 2 本、第二集買 2 本、第三集買 2 本' do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 2, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(540)  # 600*0.9      
    end

    it '第一集買 1 本、第二集買 2 本、第三集買 1 本' do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 1, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(370)  # 300*0.9+100 
    end

    it '第一集買 2 本、第二集買 3 本、第三集買 6 本' do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 6, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(1030)  # 6 * 100 * 0.9 + 2 * 100 * 0.95 + 3 * 100 = 540 + 190 + 300 
    end

  end

  context "(4) 15% off" do

    it '第一集買 1 本、第二集買 1 本、第三集買 1 本、第四集買 1 本' do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 1, "4th": 1, "5th": 0 })
      expect(@cart.calculate).to eq(340)  # 400*0.85
    end

    it '第一集買 2 本、第二集買 2 本、第三集買 2 本、第四集買 2 本' do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 2, "4th": 2, "5th": 0 })
      expect(@cart.calculate).to eq(680)  # 800*0.85      
    end

    it '第一集買 1 本、第二集買 2 本、第三集買 1 本、第四集買 1 本' do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 1, "4th": 1, "5th": 0 })
      expect(@cart.calculate).to eq(440)  # 800*0.85+100 
    end

    it '第一集買 2 本、第二集買 3 本、第三集買 6 本、第四集買 4 本' do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 6, "4th": 4, "5th": 0 })
      expect(@cart.calculate).to eq(1340)  # 800 * 0.85 + 300 * 0.9 + 200 * 0.95 + 200 = 
    end

    it '第一集買 2 本、第二集買 3 本、第三集買 6 本、第四集買 7 本' do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 6, "4th": 7, "5th": 0 })
      expect(@cart.calculate).to eq(1620)  # 800 * 0.85 + 300 * 0.9 + 600 * 0.95 + 100 = 
    end

  end

  context "(5) 20% off" do

    it '第一集買 1 本、第二集買 1 本、第三集買 1 本、第四集買 1 本、第五集買 1 本' do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 1, "4th": 1, "5th": 1 })
      expect(@cart.calculate).to eq(400)  # 500*0.8
    end

    it '第一集買 2 本、第二集買 2 本、第三集買 2 本、第四集買 2 本、第五集買 2 本' do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 2, "4th": 2, "5th": 2 })
      expect(@cart.calculate).to eq(800)  # 1000*0.8      
    end

    it '第一集買 1 本、第二集買 2 本、第三集買 1 本、第四集買 1 本、第五集買 1 本' do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 1, "4th": 1, "5th": 1 })
      expect(@cart.calculate).to eq(500)  # 500*0.8+100 
    end

    it '第一集買 2 本、第二集買 3 本、第三集買 6 本、第四集買 4 本、第五集買 1 本' do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 6, "4th": 4, "5th": 1 })
      expect(@cart.calculate).to eq(1400)  # 500 * 0.8 + 400 * 0.85 + 300 * 0.9 + 200 * 0.95 + 200
    end

    it '第一集買 1 本、第二集買 2 本、第三集買 3 本、第四集買 4 本、第五集買 5 本' do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 3, "4th": 4, "5th": 5 })
      expect(@cart.calculate).to eq(1300)  # 500 * 0.8 + 400 * 0.85 + 300 * 0.9 + 200 * 0.95 +100
    end

  end
end