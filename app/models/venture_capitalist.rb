class VentureCapitalist
    attr_accessor :name , :total_worth
    @@all =[]

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select {|vc| vc.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|f| f.venture_capitalist == self}
    end
    
    def portfolio
        funding_rounds.map {|f| f.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max {|f| f.investment}
    end

    def domainFinder(domain_name)
        funding_rounds.select {|f| f.startup.domain == domain_name}
    end

    def invested(domain_name)
        domainFinder(domain_name).sum{|x| x.investment}
    end

end


# `VentureCapitalist#offer_contract`
#   - given a **startup object**, type of investment 
#   (as a string), and the amount invested (as a float), 
#   creates a new funding round and associates it with 
#   that startup and venture capitalist.
# - `VentureCapitalist#funding_rounds`
#   - returns an array of all funding rounds for that 
#   venture capitalist
# - `VentureCapitalist#portfolio`
#   - Returns a **unique** list of all startups this 
#   venture capitalist has funded
# - `VentureCapitalist#biggest_investment`
#   - returns the largest funding round given by this 
#   venture capitalist
# - `VentureCapitalist#invested`
#   - given a **domain string**, returns the total amount 
#   invested in that domain