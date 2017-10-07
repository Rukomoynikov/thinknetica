height = 0
base = 0

while height <= 0
  p "Укажите пожалуйста высоту треугольника:"
  height = gets.chomp.to_f
end

while base  <= 0
  p "Укажите основание треугольника:"
  base = gets.chomp.to_f
end

result = 0.5 * base * height

p result