require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
tesla = Startup.new("Elon", "Tesla", "domain1")
amazon = Startup.new("Jeff Bezos", "Amazon", "domain2")
spacex = Startup.new("Elon", "SpaceX", "domain1")

anmol = VentureCapitalist.new("Anmol", 2000000000)
enrique = VentureCapitalist.new("Enrique", 5000000000)
ziming = VentureCapitalist.new("Ziming", 5000000)

# def initialize(startup, capitalist, type, investment)
round1 = FundingRound.new(tesla, anmol, "Angel", -5.0 )
round2 = FundingRound.new(amazon, enrique, "Series C", 4000000)
round3 = FundingRound.new(tesla, ziming, "Angel", 50000000 )

spacex.sign_contract(anmol, "Angel", 50000)
spacex.sign_contract(enrique, "Angel", 7000)
spacex.sign_contract(ziming, "Angel", 10000)

ziming.offer_contract(tesla, "Seed", 500000)
anmol.offer_contract(amazon, "Series B", 4000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line