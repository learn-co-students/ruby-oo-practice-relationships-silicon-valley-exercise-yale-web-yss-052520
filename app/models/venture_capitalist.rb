require 'pry'

class VentureCapitalist

  attr_accessor :name, :total_worth

  @@all = []
  def initialize(name:, total_worth:)
      @name = name
      @total_worth = total_worth

      @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select{|vc| vc.total_worth >= 1000000000}
  end

  def offer_contract(startup:, type:, investment:)
    FundingRound.new(startup: startup, venture_capitalist: self, type: type, investment: investment)
  end

  def funding_rounds
    FundingRound.all.select{|fr| fr.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.map{|fr| fr.startup}.uniq
  end

  def biggest_investment
    funding_rounds.sort_by{|fr| fr.investment}.last
  end

  def invested(domain)
   domain_array = funding_rounds.select{|fr| fr.startup.domain == domain}
   domain_array.map{|fr| fr.investment}.sum
  end


    
end

# bezos = VentureCapitalist.new(name: "Jefff Bezos", total_worth: 1000000000000)

# binding.pry
# 0