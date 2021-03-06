class TextMessages
  class << self
    def main_menu
      p ' '
      p '1. Создать станцию'
      p '2. Создать поезд'
      p '3. Создавать маршруты и управлять станциями в нем (добавлять, удалять)'
      p '4. Назначать маршрут поезду'
      p '5. Добавлять вагоны к поезду'
      p '6. Отцеплять вагоны от поезда'
      p '7. Перемещать поезд по маршруту вперед и назад'
      p '8. Просматривать список станций и список поездов на станции'
      p '0. Закрыть'
    end

    def wagons_control(_train_number)
      p "Вы выбрали поезд #{train.number}"

      p '1. Добавить вагон'
      p '2. Удалить вагон'
    end

    def create_route_starting
      p 'Управление маршрутами'
      p '1. Создать'
      p '2. Список'
      p '0. Вернуться в основное меню'
    end
  end
end
