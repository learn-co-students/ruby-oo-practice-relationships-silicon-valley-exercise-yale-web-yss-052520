class Startup
    attr_accessor :name, :founder
    attr_reader :domain

    @@all = []

    def initialize(name, founder, domain)
        @name, @founder, @domain = name, founder, domain
        
        self.class.all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @domain = domain
        self.name = name
    end

    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        self.all.map {|startup| startup.domain}
    end

    def sign_contract(vc, type, amount)
        FundingRound.new(self, vc, type, amount)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.startup == self}
    end

    def num_funding_rounds
        funding_rounds.size
    end

    def total_funds
        funding_rounds.inject(0) {|sum, fr| sum + fr.investment}
        # funding_rounds.sum {|fr| fr.investment}
    end

    def investors
        funding_rounds.map {|fr| fr.venture_capitalist}.uniq
    end

    def big_investors
        tcc = VentureCapitalist.tres_commas_club
        investors.select {|vc| tcc.include?(vc)}
    end
end
