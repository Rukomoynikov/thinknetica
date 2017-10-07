numbers = []

def numbers_valid? (user_numbers, numbers)
  numbers.concat user_numbers
    .split(',')
    .map {|side| side.to_f }

  numbers.length == 3
end

loop do
  p 'Укажите пожалуйста три коэффициента - a, b, c, через запятую:'
  break if numbers_valid?(gets.chomp, numbers)
end

def discriminant (numbers)
  a, b, c = numbers

  b ** 2 - (4 * a * c)
end

def roots (discriminant, numbers)
  a, b, c = numbers
  discriminant_root = Math.sqrt( discriminant )
  double_a = 2 * a

  root1 = (-b + discriminant_root) / double_a
  root2 = root1

  if discriminant > 0.0
    root2 = (-b - discriminant_root) / double_a
  end

  [root1, root2]
end


discriminant = discriminant(numbers)

if discriminant > 0
  root1, root2 = roots(discriminant, numbers)

  p "Дискриминант - #{discriminant}, корни - #{root1}, #{root2}"
elsif discriminant == 0
  root1 = roots(discriminant, numbers) 

  p "Дискриминант - #{discriminant}, корень - #{root1}"
else 
  p "Дискриминант #{discriminant}, корней нет."
end 