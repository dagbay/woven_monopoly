class Player 
	def initialize(name, board)
		@name = name
		@balance = 16
		@position = 0 
		@board = board
		@bankrupt = false
		@looped = false
		@properties = Array.new
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
			@looped = false
			return
		end
	end

	# Set Functions
	def move_by(num, limit)
		property = @board.get_property(get_position)
		@position += num
		property = @board.get_property(get_position)
		if get_position >= limit
			@position = get_position - limit
			property = @board.get_property(get_position)
			has_looped(property)
		end
		visit(property)
	end

	private
	
	def file_for_bankruptcy
		@bankrupt = true
	end

	def looped?
		@looped
	end

	def has_looped(property)
		@looped = true
	end

	def visit(property)
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
end