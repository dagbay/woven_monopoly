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

  def owned?
    @owned
  end

  def get_owner
    @owner
  end

  def double_rent
    @price *= 2
  end

  # Set Function
  def set_owner(player)
    @owner = player
    @owned = true
  end
end