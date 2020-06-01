require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new("Amazon", "John", "shopping")
startup2 = Startup.new("Apple", "Steve", "e-commerce")
print startup1
puts startup1

vc1 = VentureCapitalist.new("Billy Jefferson", 1500)
vc2 = VentureCapitalist.new("Russ Hannaman", 1000000001)
round1 = FundingRound.new(startup1, vc2, "Angel", )

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
