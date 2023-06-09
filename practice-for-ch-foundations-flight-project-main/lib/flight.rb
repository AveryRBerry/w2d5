class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        return true if @passengers.length >= @capacity
        return false
    end

    def board_passenger(passenger)

        if !full?()
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end
        end
    end

    def list_passengers
        arr = []
        @passengers.each do |person|
            arr << person.name()
        end
        return arr
    end

    def [](index)
        return @passengers[index]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end