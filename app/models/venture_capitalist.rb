class VentureCapitalist
    @@all = [] 
    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth 
        self.class.all << self 
    end 
    attr_accessor :name, :total_worth 
    def self.all 
        @@all 
    end 

    def self.tres_commas_club
        self.all.select {|venture_firm| venture_firm.total_worth > 1000000000}
    end 

    def tres_helper 
        if self.class.tres_commas_club.find {|firm| firm == self} 
            return true 
        else return false 
        end 
    end 

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|fund_round| fund_round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map {|fund_round| fund_round.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max {|fund_round| fund_round.investment}
    end

    def invested(domain)
        funding_rounds.select {|fund_round| fund_round.startup.domain == domain}.max {|fund_round| fund_round.investment}
    end
end 