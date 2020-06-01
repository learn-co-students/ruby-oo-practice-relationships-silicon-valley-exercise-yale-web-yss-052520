require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#startup (founder, name, domain)
s1= Startup.new("Alexis", "Smelly Ventures", "domain1")
s2= Startup.new("Maura", "I'm Hungry", "domain2")

v1 = VentureCapitalist.new("AlexisTeh", 50000)
v2 = VentureCapitalist.new("MauraKelly", 60000000000000)
v3 = VentureCapitalist.new("Anon", 70000000000000)

# (startup, venture_capitalist, type, investment)
f1 = FundingRound.new(s1, v1, "type1", 100)
f2 = FundingRound.new(s1, v2, "type2", 1000000)
f3 = FundingRound.new(s1, v3, "type3", 11232353)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line 