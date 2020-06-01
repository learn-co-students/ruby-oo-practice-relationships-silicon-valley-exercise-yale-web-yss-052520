require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

airbnb = Startup.new(name: "AirBnB", founder: "Guy", domain: "housing")
google = Startup.new(name: "Google", founder: "Alan", domain: "tech")
blockchain = Startup.new(name: "Blockchain", founder: "Dude", domain: "juice")

alan = VentureCapitalist.new(name: "alan turing", total_worth: 900000000)
alan2 = VentureCapitalist.new(name: "guyalan2", total_worth: 900000000)

funding_aa = FundingRound.new(airbnb, alan, "Series C", 84000)
funding_ga2 = FundingRound.new(google, alan2, "Series B", 8100)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line

