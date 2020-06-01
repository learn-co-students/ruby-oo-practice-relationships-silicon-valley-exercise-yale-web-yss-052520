class FundingRound
    attr_reader :startup, :venture_capitalist, :type, :investment
    @@all = []
    def initialize(startup, venture_capitalist, type, investment)
        @startup=startup
        @venture_capitalist=venture_capitalist
        @type=type
        self.investment=investment
        @@all << self
    end
    def investment=(amount)
        @investment=(amount<0) ? 0.to_f : amount.to_f
    end
    def self.all
        @@all
    end
end