require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Eric")
investor1 = VentureCapitalist.new("Arthur", 2000000000)
investor2 = VentureCapitalist.new("Bob", 2000000000)
startup1.pivot("domain","name")
round1 = FundingRound.new(startup1, investor1, "Series A", 10000.0)
round2 = FundingRound.new(startup1, investor1, "Series B", 1000)
round3 = FundingRound.new(startup1, investor1, "Series C", 250000)
round4 = FundingRound.new(startup1, investor2, "Series C", 250000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line