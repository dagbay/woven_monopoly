require 'colorize'

class Player 
	def initialize(name)
		@name = name
		@balance = 16
		@position = 0 
		@properties = Array.new
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
	def get_properties
		@properties
	end
	def looped?
		@looped
	end
	def check_property(property)
		if property.owned?
			pay_rent(property.get_price)
		else
			buy_property(property)
		end
	end
	# Set Functions
	def pay_rent(num)
		@balance -= num
		if @balance > 0
			@balance
		else
			false
		end
	end
	def receive
		@balance += 1
		@looped = false
	end
	def buy_property(property)
		property.set_owner(get_name)
		@properties << property
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
end

# TODO: Complete the move_by logic
# TODO: Check if you can make a generic function for colorizing the console