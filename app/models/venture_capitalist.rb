class VentureCapitalist
    @@all = []

    attr_accessor :name, :total_worth 

    def initialize(name, total_worth)
        @total_worth = total_worth
        @name = name
        @@all << self
    end 
    
    def self.all 
        @@all
    end 

    def tres_commas_club
        VentureCapitalist.all.select {|guy| guy.total_worth > 1000000000}
    end 

    def offer_contract(startup, investment, type)
        FundingRound.new(startup, self, type, investment)
    end 

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end 

    def portfolio
        self.funding_rounds.map {|round| round.startup}.uniq
    end 

    def biggest_investment
        big_investment = self.funding_rounds.sort{|elem| elem.investment}
        big_investment[-1]
    end
    
    def invested(domain)
    #    investment =  self.funding_rounds.map {|elem| elem.investment}
        startups = self.portfolio.select {|elem| elem.domain == domain}
        sum = 0
        startups.each do |elem|
          sum +=  elem.total_funds
        end 
        sum 
    end 




end
