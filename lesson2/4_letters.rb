letters = {}
good = ['а', 'е', 'ё', 'и', 'й', 'о', 'у', 'э', 'ю', 'я']

('а'..'я')
  .each_with_index do |letter, index|
    letters[letter] = index if good.include?(letter)
  end

p letters