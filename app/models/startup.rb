class Startup
    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def self.find_by_founder(founder)
        Startup.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        Startup.all.map {|startup| startup.domain}.uniq
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def fundingRoundLooker
        FundingRound.all.select {|f|f.startup == self}
    end

    def num_funding_rounds
        fundingRoundLooker.size
    end

    def total_funds
        fundingRoundLooker.sum {|f| f.investment}
    end

    def investors
        fundingRoundLooker.map {|f| f.venture_capitalist}.uniq
    end

    def big_investors
        investors.select {|vc| vc.total_worth > 1000000000}
    end


end


# - `Startup#sign_contract`
#   - given a **venture capitalist object**, type of investment (
#       as a string), and the amount invested (as a float), 
#       creates a new funding round and associates it with that 
#       startup and venture capitalist.
# - `Startup#num_funding_rounds`
#   - Returns the total number of funding rounds that the 
#   startup has gotten
# - `Startup#total_funds`
#   - Returns the total sum of investments that the startup has gotten
# - `Startup#investors`
#   - Returns a **unique** array of all the venture capitalists 
#   that have invested in this company
# - `Startup#big_investors`
#   - Returns a **unique** array of all the venture capitalists 
#   that have invested in this company and are in the Trés Commas 
#   club