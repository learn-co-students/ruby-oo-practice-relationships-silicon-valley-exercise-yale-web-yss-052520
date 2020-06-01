class Startup

    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []
    
    def initialize(name:, founder:, domain:)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def self.all
        @@all
    end
    
    def self.domains
        self.all.map {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def all_funding_rounds
        FundingRound.all.select{|fr| fr.startup == self}
    end

    def num_funding_rounds
        self.all_funding_rounds.count
    end

    def total_funds
        self.all_funding_rounds.map{|fr| fr.investment}.reduce(:+)
    end

    def investors
        self.all_funding_rounds.map{|fr| fr.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select{|investor| VentureCapitalist.tres_commas_club.any?(investor)}.uniq
    end


        


end
