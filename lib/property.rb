class Property
    def initialize(hash)
        @name = hash['name']
        @price = hash['price'].nil? ? "n/a" : hash['price']
        @colour = hash['colour'].nil? ? "n/a" : hash['colour']
        @type = hash['type']
    end
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
end