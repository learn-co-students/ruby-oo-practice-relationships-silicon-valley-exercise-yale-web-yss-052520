class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        funding_rounds.map{|round| round.startup}.uniq()
    end

    def biggest_investment()
        funding_rounds.max_by{|round| round.investment}
    end

    def find_by_domain(domain)
        # portfolio.select{|startup| startup.domain == domain}
        funding_rounds.select{|round| round.startup.domain == domain}
    end

    def invested(domain)
        find_by_domain(domain).reduce(0){|total, round| total + round.investment}
    end
        

    def self.all()
        @@all 
    end

    def self.tres_commas_club()
        all().select{|vc| vc.total_worth > 1000000000}
    end
end
