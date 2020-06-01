require 'pry'

class FundingRound

  attr_reader :startup, :venture_capitalist, :investment
  attr_accessor :type

  @@all = []

  def initialize(startup:, venture_capitalist:, type:, investment:)
    
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment.to_f

    @@all << self
  end

  def self.all
    @@all
  end

  def investment=(investment)
    if investment >= 0
      @investment = investment.to_f
    else
      puts "You can't invest a negative amount of money"
    end
  end

end

# fr = FundingRound.new(startup: "PiedPiper", venture_capitalist: "Bezos", type: "Angel", investment: 1200000)

# binding.pry
# 0