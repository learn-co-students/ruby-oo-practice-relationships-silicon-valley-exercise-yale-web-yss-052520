class Startup

    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []


    def initialize(founder)
        @founder = founder
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end
        
    def funding_rounds
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.reduce(0) {|total, round| total + round.investment}
    end

    def investors
        funding_rounds.map do |round|
            round.venture_capitalist
        end.uniq
    end

    def big_investors
        investors.select do |investor|
            investor.total_worth > 1000000000
        end
    end

    def self.find_by_founder(founder)
        all.find do |startup|
            startup.founder == founder
        end
    end

    def self.domains
        all.map do |startup|
            startup.domain
        end
    end
end
