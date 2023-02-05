class Player 
    attr_accessor :balance
    attr_reader :name, :attribute_name, :position
    def initialize(name)
        @name = name
        @balance = 16
        @position = 0
    end
    def move_by(num)
        @position += num
    end
end