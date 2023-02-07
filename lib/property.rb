class Property
  def initialize(hash)
    @name = hash['name']
    @price = hash['price'].nil? ? "n/a" : hash['price']
    @colour = hash['colour'].nil? ? "n/a" : hash['colour']
    @type = hash['type']
    @owned = false
  end
  # Get Functions
  def get_name
    @name
  end
  def get_price
    @price
  end
  def get_colour
    @colour
  end
  def get_type
    @type
  end
  def get_hash
    @hash = { :name => @name, :price => @price, :colour => @colour, :type => @type }
    @hash
  end
  def owned?
    @owned
  end
  def get_owner
    @owner
  end
  def double_rent
    @price *= 2
    puts " · #{get_name} has doubled its rent! The rent is now $#{get_price}.".red
  end
  # Set Function
  def set_owner(player)
    @owner = player
    @owned = true
    puts " · #{player.get_name} has bought #{get_name} for $#{get_price}! Since no player owns it!".red
  end
end