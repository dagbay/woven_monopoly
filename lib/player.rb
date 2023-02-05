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
        if @balance > 0
            puts "You paid $#{num}. You now have $#{@balance} left in your balance."
        else
            puts "You are bankrupt!"
        end
    end
    def move_by(num, limit)
        @position += num
        puts "#{@name} moved #{num} times up the board"
        if @position >= limit
            @position = @position - limit
            puts "However, #{@name} has reached the limit and has looped around the board. And is now at position: #{@position}"
        else
            puts "#{@name} is now at position: #{@position}"
        end
    end
end