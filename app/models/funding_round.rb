class FundingRound
    
    attr_reader :startup, :capitalist
    attr_accessor :type, :investment

    @@all = []
    def initialize(startup, capitalist, type, investment)
        @startup = startup
        @capitalist = capitalist
        @type = type
        (@investment = investment.to_f) if investment > 0
        @@all << self
    end

    def self.all
        @@all
    end
end
