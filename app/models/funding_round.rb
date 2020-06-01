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
        # if amount < 0
        #     @investment=0.to_f
        # else
        #     @investment=amount.to_f
        # end
        # return
        @investment=(amount<0) ? 0.to_f : amount.to_f
    end
    def self.all
        @@all
    end
end