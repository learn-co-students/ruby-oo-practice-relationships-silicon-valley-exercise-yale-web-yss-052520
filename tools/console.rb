require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Awesome Startup", "Bob Ross", "as.com")
s2 = Startup.new("Bad Startup", "Bob Saget", "bs.com")
s3 = Startup.new("Crazy Startup", "Bob the Builded", "cs.com")
s4 = Startup.new("Dead Startup", "Robert Frost", "ds.com")
s5 = Startup.new("Excitable Startup", "Bob 2", "es.com")

vc1 = VentureCapitalist.new("Bob", 100)
vc2 = VentureCapitalist.new("Andy", 10)
vc3 = VentureCapitalist.new("Jane", 20)
vc4 = VentureCapitalist.new("Joe", 50)
vc5 = VentureCapitalist.new("Drew", 90)
vc6 = VentureCapitalist.new("Chad", 70)

fr1 = FundingRound.new(s1, vc1, "Series A", 500)
fr2 = FundingRound.new(s2, vc4, "Series B", 5000)
fr3 = FundingRound.new(s1, vc3, "Series C", 78800)
fr4 = FundingRound.new(s4, vc4, "Series A", 3000)
fr5 = FundingRound.new(s4, vc5, "Series A", 10)
fr6 = FundingRound.new(s5, vc6, "Series A", 250)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line