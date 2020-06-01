class Startup
    attr_accessor :name 
    attr_reader :founder, :domain

    @@all = []

    def initialize(founder, name, domain)
        @founder = founder
        @name = name
        @domain = domain
        self.class.all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        all.find do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(capitalist, type, investment)
        FundingRound.new(self, capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
    end

    def num_funding_rounds
        funding_rounds.size
    end

    def total_funds
        sum = 0
        funding_rounds.each do |round|
            sum += round.investment
        end
        sum
    end

    def investors
        funding_rounds.map {|funding| funding.capitalist}.uniq
    end  

    def big_investors 
        investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end 
end
