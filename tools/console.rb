require_relative '../config/environment.rb'
def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
flatiron = Startup.new("Flatiron", "James", "education")
chocFactory = Startup.new("Charlie Chocolate", "Willy Wonka", "food")
yale = Startup.new("Yale University", "Elihu", "education")
larissa = VentureCapitalist.new("Larissa", 3000000000)
bob = VentureCapitalist.new("Bob", 300)
fundround1 = FundingRound.new(chocFactory, bob, "angel", 200)
fundround2 = FundingRound.new(chocFactory, bob, "angel", 200)
fundround3 = FundingRound.new(chocFactory, bob, "angel", 200)
fundround4 = FundingRound.new(flatiron, larissa, "Seed", 5678)
pp larissa.offer_contract(yale, "Series B", 3456)
pp larissa.funding_rounds
pp larissa.portfolio
pp bob.portfolio
pp larissa.biggest_investment
pp larissa.invested("education")
pp larissa.invested("shoes")
binding.pry
0 #leave this here to ensure binding.pry isn't the last line