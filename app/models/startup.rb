require 'pry'

class Startup

  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []


  def initialize(name:, founder:, domain:)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(domain:, name:)
    @name = name
    @domain = domain
  end

  def self.all
    @@all
  end

  def self.find_by_founder(name)
    self.all.find{|startup| startup.founder == name}
  end

  def self.domains
    self.all.map{|startup| startup.domain}
  end

  def sign_contract(venture_capitalist:, type:, investment:)
    FundingRound.new(startup: self, venture_capitalist: venture_capitalist, type: type, investment: investment)
  end

  def funding_rounds
    FundingRound.all.select{|fr| fr.startup == self}
  end

  def num_funding_rounds
    funding_rounds.length
  end

  def total_funds
    funding_rounds.map{|fr| fr.investment}.sum
  end

  def investors
    funding_rounds.map{|fr| fr.venture_capitalist}.uniq
  end

  def big_investors
    investors.select{|investor| investor.total_worth >= 1000000000}
  end

  private

  attr_writer :domain

end

# newstartup = Startup.new(name: "PiedPiper", domain: "TV Show", founder: "Thomas Middleditch")

# binding.pry
# 0
