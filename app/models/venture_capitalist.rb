class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        save 
    end

    def save
        self.class.all << self 
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map {|fr| fr.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max {|fr1,fr2| fr1.investment <=> fr2.investment}
    end

    def invested(domain)
        total = 0
        funding_rounds.each do |fr|
            if fr.startup.domain == domain
                total += fr.investment
            end
        end
        total
    end

    def self.all 
        @@all 
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth >= 1000000000 }
    end

end
