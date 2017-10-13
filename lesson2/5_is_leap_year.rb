require('pry')

monthes = {
  'Январь'=> 31,
  'Февраль'=> 28,
  'Март' => 31,
  'Апрель' => 30,
  'Май' => 31,
  'Июнь' => 30,
  'Июль' => 31,
  'Август' => 31,
  'Сентябрь' => 30,
  'Октябрь' => 31,
  'Ноябрь' => 30,
  'Декабрь' => 31
}

result_year = ''

def is_year_leap? (year)
  leap = false
  year = year.split('.').last.to_i

  if (year % 4 == 0 and not year % 100)  or (year % 100 == 0 and year % 400 == 0) 
    leap = true
  else 
    false
  end

  leap

end

def is_year_valid? (year)
 /[01-31]{2}\.[01-12]{2}\.\d{4}/.match(year).nil?
end

loop do 
  p 'Введите пожалуйста дату в формате дд.мм.гггг'
  year = gets.chomp

  if is_year_valid?(year)
    result_year = year
    break
  end
end

case is_year_leap?(result_year)
  when true then monthes['Февраль'] = 29
  when false then monthes['Февраль'] = 28
end

selected_month = result_year.split('.')[1].to_i
result = 0

monthes.values.slice(0, selected_month).each do |days_in_month|
  result += days_in_month.to_i
end

p "Порядковый номер даты - #{result}"