def pizza_price(length, array)
  price = 0
  array.each do |item|
    if item == "small"
      price += 5
    elsif item == "medium"
      price += 7
    elsif item == "large"
      price += 10
    end
  end
  price += length
  return price
end
