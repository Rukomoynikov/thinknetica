sides = []

def sides_valid? (user_sides, sides)
  sides.concat user_sides
    .split(',')
    .map {|side| side.to_f }
    .select { |side| side > 0 }

  sides.length == 3
end

loop do
  p 'Укажите пожалуйста три стороны треугольника через запятую:'
  break if sides_valid?(gets.chomp, sides)
end

gipotenuza = sides.sort.last
katets = sides.sort.slice(0, 2)

def is_squared? (gipotenuza, katets)
  gipotenuza ** 2 == (katets[0] ** 2) + (katets[1] ** 2) 
end 

def is_isosceles? (sides)
  2 == sides
    .uniq
    .length
end

def is_equilateral? (sides)
  1 == sides
    .uniq
    .length
end

if is_equilateral?(sides)
  p 'Треугольник равносторонний и равнобедренный, но не прямоугольный.'
elsif is_squared?(gipotenuza, katets)
  message = 'Треугольник прямоугольный'
  is_isosceles?(sides) && message += ' и равнобедренный'
  message += '.'

  p message
else
  p 'Треугольник не прямоугольный'
end