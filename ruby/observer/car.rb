require 'observer'
require './notifier'

class Car
    include Observable
    attr_reader :mileage, :service
    def initialize(mileage=0, service=3000)
        @mileage, @service = mileage, service
        add_observer(Notifier.new)
    end

    def log(miles)
        @mileage += miles
        changed
        notify_observers(self, miles) 
    end
end


car = Car.new(2300, 5000)
car.log(300)
car.log(400)