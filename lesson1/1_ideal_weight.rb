name = ''
height = 0
weight = 0
ideal_weight = 0


while name.length == 0
  p "Представьтесь пожалуйста:"
  name = gets.chomp
end

while weight <= 0
  p "Укажите пожалуйста ваш настоящий вес:"
  height = gets.chomp.to_i
end

while height <= 0
  p "Укажите пожалуйста ваш рост:"
  height = gets.chomp.to_i
end

ideal_weight = height - 110
is_user_have_ideal_weight? = (weight - ideal_weight) <= 0

if is_user_have_ideal_weight?
  p "#{name}, ваш вес уже идеальный."
else 
  p "Для вашего роста #{height}, идеальный вес - #{ideal_weight}."
end