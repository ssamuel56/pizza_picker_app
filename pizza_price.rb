def pizza_price(length, array)
  price = 0
  counter = 0
  array.each do |item|
    if item == "small"
      price += 5
      counter =+ 1
    elsif item == "medium"
      price += 7
      counter += 1
    elsif item == "large"
      price += 10
      counter += 1
    end
  end
  price += length - counter
  return price
end
