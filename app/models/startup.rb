class Startup
    attr_reader :founder
    attr_accessor :name, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find{|startup|startup.founder == founder}
    end

    def self.domains
        self.all.map{|startup| startup.domain}
    end

    def sign_contract(capitalist, type, investment)
        FundingRound.new(self, capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select {|round| round.startup == self}.count
    end

    def total_funds
        array = FundingRound.all.select {|round| round.startup == self}
        array.reduce(0) {|sum, n| sum + n.investment}
    end

    def investors
        array = FundingRound.all.select {|round| round.startup == self}
        array.map{|round| round.venture_capitalist}.uniq
    end

    def big_investors
        investors.select {|investor| investor.total_worth >= 1000000000}
    end

end
