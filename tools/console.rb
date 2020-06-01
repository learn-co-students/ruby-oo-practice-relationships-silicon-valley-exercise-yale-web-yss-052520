require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
startup1 = Startup.new("name1", "founder1", "domain1")
startup2 = Startup.new("Snacebook", "Mark zuckersnail", "Snacebook.io")
vc1 = VentureCapitalist.new("me", 1000000000)
vc2 = VentureCapitalist.new("my_sister", 1000)
fd1 = FundingRound.new(startup1, vc1, 'type1', 100000)
fd2 = FundingRound.new(startup2, vc2, 'type2', 9)
fd3 = FundingRound.new(startup2, vc1, 'type1', 90)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line