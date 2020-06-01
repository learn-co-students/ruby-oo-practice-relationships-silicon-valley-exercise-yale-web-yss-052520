# The joiner class for the many-many relationship
class FundingRound

    attr_reader :startup, :venture_capitalist, :type, :investment 
    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup, @venture_capitalist, @type, @investment = startup, venture_capitalist, type, investment
        self.class.all << self 
    end 

    def self.all 
        @@all
    end 

end