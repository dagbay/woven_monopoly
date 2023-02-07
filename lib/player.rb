require 'colorize'
class Player 
	def initialize(name, board)
		@name = name
		@balance = 16
		@position = 0 
		@board = board
		@bankrupt = false
		@looped = false
		@properties = Array.new
		puts "Player Class: #{@name} is now playing!".blue
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

	def get_current_property
		@current_property
	end

	def owned_properties
		@properties
	end

	def bankrupt?
		@bankrupt
	end

	def receive(num, payer = '')
		@balance += num
		if payer.empty?
			puts " · #{get_name} received $1 for looping the board.".red
			@looped = false
			return
		end
		puts " · #{payer} has paid $#{num} as rent to #{get_name}.".red
	end

	# Set Functions
	def move_by(num, limit)
		property = @board.get_property(get_position)
		puts "\n--- #{get_name}'s Turn (Currently At: #{property.get_name}, Position: #{get_position}, Balance: $#{get_balance}) ---\n".green
		puts " #{get_name} has done the following:".red
		@position += num
		puts " · #{get_name} has rolled and moved #{num} time/s.".red
		property = @board.get_property(get_position)
		if get_position >= limit
			@position = get_position - limit
			property = @board.get_property(get_position)
			has_looped(property)
		end
		visit(property)
		after_action_report(property)
		puts "--- End of Turn ---\n".green
	end

	private
	def file_for_bankruptcy
		@bankrupt = true
		puts " · #{get_name} has insufficient funds and has filed for bankruptcy!".red
	end

	def looped?
		@looped
	end

	def has_looped(property)
		puts " · However, #{get_name} has looped around the board and is now at property: #{property.get_name}.".red
		@looped = true
	end

	def visit(property)
		puts " · #{get_name} is now at property: #{property.get_name}.".red
		@current_property = property
		if looped? && get_position > 0
			receive(1)
		end
		check_property(property)
	end

	def check_property(property)
		return if property.get_name == "GO"
		unless property.owned? 
			buy_property(property)
			return
		end
		unless property.get_owner.get_name == get_name
			pay_rent(property.get_price, property.get_owner)
			return
		end
		puts " · However, #{get_name} owns #{property.get_name} so nothing will happen.".red
	end

	def buy_property(property)
		@balance -= property.get_price
		property.set_owner(self)
		@properties << property
		unless @properties.length > 1
			return
		end
		if @properties.all? { |p| p.get_colour == property.get_colour }
			@properties.each do |property|
				property.double_rent
			end
		end
	end

	def pay_rent(num, owner)
		@balance -= num
		unless @balance >= 0
			file_for_bankruptcy
			return
		end
		owner.receive(num, get_name)
	end

	def after_action_report(property)
		puts "\n ··· After Action Report ···".yellow
		puts "  · Now At: #{property.get_name}".yellow
		puts "  · In Position: #{get_position}".yellow
		puts "  · Current Balance: $#{get_balance}".yellow
		puts "  · Properties Owned: #{owned_properties.map {|p| p.get_name}}".yellow
		puts " ··· End of Report ···\n".yellow
	end
end

# TODO: Complete the move_by logic
# TODO: Check if you can make a generic function for colorizing the console