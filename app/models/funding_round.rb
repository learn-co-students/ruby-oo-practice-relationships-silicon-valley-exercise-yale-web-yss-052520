class FundingRound

    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
    end

    def self.all
        @@all
    end

end
