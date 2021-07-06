require 'pry'

class Startup

    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        self.domain = domain
        @name = name
    end

    def domain=(domain)
        @domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
      Startup.all.find { |startup| startup.founder == founder }
    end

    def self.domains
      Startup.all.map { |startup| startup.domain }.uniq
    end

    def sign_contract(venture_cap, inv_type, amount)
      FundingRound.new(self, venture_cap, inv_type, amount)
    end

    def funding_rounds
      FundingRound.all.select { |funding_rnd| funding_rnd.startup == self }
    end

    def num_funding_rounds
      self.funding_rounds.count
    end

    def total_funds
      total_funds_amt = 0
      self.funding_rounds.each { |funding_rnd|
        total_funds_amt += funding_rnd.investment
      }
      total_funds_amt
    end

    def investors
      self.funding_rounds.map { |funding_rnd| funding_rnd.venture_capitalist }.uniq
    end

    def big_investors
      tres_commas_club = VentureCapitalist.tres_commas_club
      self.investors.select { |investor|
        tres_commas_club.any? { |club_member| club_member == investor }
      }
    end

end
