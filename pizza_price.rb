def pizza_price(length, size)
  price = 0
  if size == "small"
    price += 5 + length
  elsif size == "medium"
    price += 7 + length
  else size == "large"
    price += 10 + length
  end
end
