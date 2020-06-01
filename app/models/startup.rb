class Startup

    attr_accessor :name
    attr_reader :founder, :domain
    
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain 
        save 
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def save 
        self.class.all << self
    end

    def sign_contract(vc, type, investment)
        FundingRound.new(self, vc, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.startup == self}
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.sum {|fr| fr.investment}
    end

    def investors
        funding_rounds.map {|fr| fr.venture_capitalist}.uniq
    end

    def big_investors
        VentureCapitalist.tres_commas_club.select do |vc|
            investors.include?(vc)
        end
    end

    def self.all
        @@all 
    end

    def self.find_by_founder(founder)
        self.all.detect {|startup| startup.founder == founder}
    end

    def self.domains
        self.all.map {|startup| startup.domain }
    end 

        private

    def domain=(domain)
        @domain = domain 
    end


end
