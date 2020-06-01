class Startup
    attr_accessor :name, :domain
    attr_reader :founder    
    @@all = []

    def initialize(founder, name, domain)
        @name = name
        @founder = founder 
        @domain = domain 
        @@all << self 
    end 


    def pivot(domain, name)
        @domain = domain 
        @name = name 
    end 

    def self.all 
        @@all
    end 

    def self.find_by_founder(name)
        Startup.all.select {|elem| elem.founder == name}
    end 

    def self.domains
     Startup.all.map {|elem| elem.domain}.uniq   
    end
    
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end 

    def num_funding_rounds 
        FundingRound.all.select {|elem| elem.startup == self}.count 
    end 

    def total_funds  
      funds = FundingRound.all.select {|elem| elem.startup == self}
       sum = funds.map{|elem| elem.investment}
        sum.inject(0) {|sum, x| sum + x}
    end 

    def investors 
       rounds = FundingRound.all.select {|elem| elem.startup == self}
       rounds.map {|elem| elem.venture_capitalist}.uniq 
    end 

    def big_investors 
        vent_caps = self.investors
        vent_caps.map {|guy| guy.tres_commas_club}.uniq 
    end 




end
