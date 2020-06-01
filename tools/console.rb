require_relative '../config/environment.rb'
require 'pry'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
newstartup = Startup.new(name: "PiedPiper", domain: "TV Show", founder: "Thomas Middleditch")
oldstartup = Startup.new(name: "learn.co", domain: "Hacking", founder:  "Sylwia")
bezos = VentureCapitalist.new(name: "Jefff Bezos", total_worth: 1000000000000)
gates = VentureCapitalist.new(name: "Billl Gates", total_worth: 2000000000000)

newstartup.sign_contract(venture_capitalist: bezos, type: "angel", investment: 10000000)
oldstartup.sign_contract(venture_capitalist: bezos, type: "angel", investment: 13000000)
bezos.offer_contract(startup: newstartup, type: "seed", investment: 2000000)
gates.offer_contract(startup: newstartup, type: "angel", investment: 1111111)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line