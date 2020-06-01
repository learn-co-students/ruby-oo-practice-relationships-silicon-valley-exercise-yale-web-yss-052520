require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Google", "Founder", "domain")
s2 = Startup.new("facebook", "Mark", "domain")
s3 = Startup.new("Microsoft", "Bill", "dmns")

v1 = VentureCapitalist.new("Jeff", 10000000000)
v2 = VentureCapitalist.new("Sam", 10)
v3 = VentureCapitalist.new("Alex", 12345)

f1 = FundingRound.new(s1,v1,"Angel",100)
f2 = FundingRound.new(s1,v2,"Series A",200)
f3 = FundingRound.new(s2,v3,"Series B",20)
f4 = FundingRound.new(s2,v3,"Series C",10)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line