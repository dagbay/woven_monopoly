class Property
    attr_accessor :name, :price, :colour, :type
    def initialize(hash)
        @name = hash['name']
        @price = hash['price'].nil? ? "n/a" : hash['price']
        @colour = hash['colour'].nil? ? "n/a" : hash['colour']
        @type = hash['type']
    end
    def get_hash
        @hash = { :name => @name, :price => @price, :colour => @colour, :type => @type }
        @hash
    end
end