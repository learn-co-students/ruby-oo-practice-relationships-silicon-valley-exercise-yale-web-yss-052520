require_relative '../config/environment.rb'
require 'pry'


def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup = Startup.new("Apollo", "Alex", "Tech")
startup1 = Startup.new("Hermes", "Alexis", "Healthcare")
vc = VentureCapitalist.new("Neil", 1000000000)
vc1 = VentureCapitalist.new("Natasha", 999999999)
fr = FundingRound.new(startup, vc, "Angel", 100000.0)
fr1 = FundingRound.new(startup1, vc1, "Series C", 50000.0)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line