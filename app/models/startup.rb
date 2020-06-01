class Startup

    attr_reader :founder
    attr_accessor :name, :domain

    @@all= []

    def initialize (founder, name, domain)
        @founder = founder
        @name = name
        @domain = domain
        self.class.all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(founder_input)
        self.all.find {|one_startup| one_startup.founder == founder_input} 
    end

    def self.domains
        self.all.map {|startups| startups.domain}.uniq
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end 

    def funding_rounds 
        FundingRound.all.select {|fund_round| fund_round.startup == self}
    end 

    def num_funding_rounds 
        self.funding_rounds.length 
    end 

    def total_funds 
        self.funding_rounds.sum {|fund_round| fund_round.investment}
    end 

    def investors 
        self.funding_rounds.map {|round| round.venture_capitalist}.uniq 
    end 

    def big_investors
        self.investors.select {|investor| investor.tres_helper}.uniq 
    end 
end
