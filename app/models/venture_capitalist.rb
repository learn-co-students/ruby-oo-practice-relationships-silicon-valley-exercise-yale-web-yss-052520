class VentureCapitalist
    attr_reader :name
    attr_accessor :total_worth
    
    @@all = []
    
    def initialize(name, total_worth)
        @name=name
        @total_worth=total_worth
        @@all << self
    end
    
    def self.all
        @@all
    end
    
    def self.tres_commas_club
        @@all.select{|vc| vc.total_worth >= 1000000000}
    end
    
    def offer_contract(startup, inv_type, amount)
      FundingRound.new(startup, self, inv_type, amount)
    end
    
    def funding_rounds
      FundingRound.all.select{|round| round.venture_capitalist == self}
    end
    
    def portfolio
      funding_rounds.map{|round| round.startup}.uniq
    end
    
    def biggest_investment
      funding_rounds.max{|round1, round2| round1.investment <=> round2.investment}
    end
    
    def invested(domain)
      funding_rounds.reduce(0.0) do |total, round|
        if round.startup.domain == domain
          total += round.investment
        end
        total
      end
    end
    
end