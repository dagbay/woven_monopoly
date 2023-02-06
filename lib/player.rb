require 'colorize'
class Player 
	def initialize(name)
		@name = name
		@balance = 16
		@position = 0 
		@looped = false
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
	def check_loop
		@looped
	end
	# Set Functions
	def pay_rent(num)
		@balance -= num
		if @balance > 0
			puts "You paid $#{num}. You now have $#{get_balance} left in your balance."
		else
			puts "You are bankrupt!"
		end
	end
	def move_by(num, limit)
		puts "\n--- #{get_name}'s Turn ---".green
		@position += num
		puts "· #{get_name} moved #{num} times up the board.".red
		if get_position >= limit
			@position = get_position - limit
			puts "· However, #{get_name} has looped around the board and is now at position: #{get_position}.".red
		else
			puts "· #{get_name} is now at position: #{get_position}.".red
		end
		puts "--- End of Turn ---\n".green
	end
	def add_loop
		@looped = true
	end
end

# TODO: Complete the move_by logic
# TODO: Check if you can make a generic function for colorizing the console

player = Player.new("Daniel")
player.move_by(3,10)
player.move_by(7,10)