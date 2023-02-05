class Player 
    def initialize(name)
        @name = name
        @balance = 16
        @position = 0
    end
    # Get Functions
    def get_balance
        @balance
    end
    def get_name
        @name
    end
    def get_position
        @position
    end
    # Set Functions
    def pay_rent(num)
        @balance -= num
    end
    def move_by(num)
        @position += num
    end
end