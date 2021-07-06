require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new("Amazon", "John", "shopping")
startup2 = Startup.new("Apple", "Steve", "e-commerce")
p startup1

vc1 = VentureCapitalist.new("Billy Jefferson", 1500)
vc2 = VentureCapitalist.new("Russ Hannaman", 1000000001)
p vc2

puts "tres_commas_club"
p VentureCapitalist.tres_commas_club

round1 = FundingRound.new(startup1, vc2, "Angel", 200000)

p round1

p Startup.find_by_founder("Steve")

p Startup.domains

puts "sign_contract"
p startup1.sign_contract(vc2, "Series A", 200000)
p startup1.sign_contract(vc1, "Series A", 10)

puts "num_funding_rounds"
p startup1.num_funding_rounds

puts "total_funds"
p startup1.total_funds

puts "investors"
p startup1.investors

puts "big_investors"
p startup1.big_investors

puts "offer_contract"
p vc1.offer_contract(startup1, "Series B", 500000)

puts "vc funding_rounds"
p vc2.funding_rounds

puts "portfolio"
p vc2.portfolio

puts "biggest_investment"
p vc2.biggest_investment

puts "invested"
p vc2.invested("shopping")


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
