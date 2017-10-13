cart = {}
BREAK_WORD = 'стоп'

def is_stop? (word)
  word == BREAK_WORD
end

def prepare_product_hash (product_name, 
                          product_price_for_one, 
                          product_count)
  {
    product_name: product_name, 
    product_price_for_one: product_price_for_one.to_f,
    product_count: product_count.to_f
  }
end

def add_to_cart (product_line, cart)
  name = product_line[:product_name]

  cart[name] = {
    product_price_for_one:  product_line[:product_price_for_one],
    product_count: product_line[:product_count],
    total: total_for_one_line(product_line[:product_price_for_one], 
                              product_line[:product_count]) 
  }
end

def update_cart(product_line, cart)
  name = product_line[:product_name]
  product_from_cart = cart[name]
  total = product_from_cart[:total] +
          total_for_one_line(product_line[:product_price_for_one], 
                             product_line[:product_count])

  cart[name] = {
    product_count: product_line[:product_count] + 
                   product_from_cart[:product_count],
    total: total
  }
end

def total_for_one_line (count, price)
  count * price
end

def name
  p 'Введите название товара:'
  product_name = gets.chomp
end

def price_for_one
  p 'Введите цену за единицу:'
  product_price_for_one = gets.chomp
end

def count
  p 'Введите количество купленного товара:'
  product_count = gets.chomp
end

loop do
  product_name = name
  break if is_stop?(product_name)

  product_price_for_one = price_for_one
    
  product_count = count

  product_line = prepare_product_hash(product_name, 
                       product_price_for_one, 
                       product_count)

  if cart[product_name]
    update_cart(product_line, cart)
  else
    add_to_cart(product_line, cart)
  end

end

p cart