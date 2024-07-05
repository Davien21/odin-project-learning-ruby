def stock_picker(prices) # in 0(n)
  return [] if (prices.empty? || prices.length < 2)
  
  min_price_index = 0
  max_profit = 0
  best_days = [0, 1]

  prices.each_with_index do |price, index|
    min_price_index = index if (price < prices[min_price_index])

    if (index > min_price_index) # you must buy before you sell
      profit = price - prices[min_price_index]
      if (profit > max_profit)
        max_profit = profit
        best_days = [min_price_index, index]
      end
    end
  end

  best_days
end


# Example usage
puts stock_picker([17,3,6,9,15,8,6,1,10])
