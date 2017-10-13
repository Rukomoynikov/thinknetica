array = [1, 1]
fibonacci_number = 0

loop do
  fibonacci_number = array[-1] + array[-2]

  if fibonacci_number <= 100
    array << fibonacci_number
  else
    break
  end
end

p array