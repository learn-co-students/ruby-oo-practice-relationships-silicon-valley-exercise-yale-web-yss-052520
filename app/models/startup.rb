class Startup
  attr_reader :founder, :domain, :name
  
  @@all = []
  
  def initialize(name, founder, domain)
    @founder = founder
    @name = name
    @domain = domain
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def pivot(domain, name)
    @domain = domain
    @name = name
  end
  
  def self.find_by_founder(founder_name)
    @@all.find{|startup| startup.founder == founder_name}
  end
  
  def self.domains
    @@all.map{|startup| startup.domain}.uniq
  end
  
  def sign_contract(vc, investment_type, amount)
    FundingRound.new(self, vc, investment_type, amount)
  end
  
  def funding_rounds
    FundingRound.all.select{|round| round.startup == self}
  end
  
  def num_funding_rounds
    funding_rounds.count
  end
  
  def total_funds
    funding_rounds.reduce(0.0){|total, round| total += round.investment}
  end
  
  def investors
    funding_rounds.map{|round| round.venture_capitalist}.uniq
  end
  
  def big_investors
    investors.select{|investor| VentureCapitalist.tres_commas_club.include? (investor)}
  end
  
end
