class VentureCapitalist
  attr_accessor :total_worth
  attr_reader :name

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth

    @@all << self
  end

  def self.tres_commas_club
    @@all.select { |venture_cap| venture_cap.total_worth > 1000000000 }
  end

  def self.all
    @@all
  end

  def offer_contract(startup, inv_type, amount)
    FundingRound.new(startup, self, inv_type, amount)
  end

  def funding_rounds
    FundingRound.all.select { |funding_rnd| funding_rnd.venture_capitalist == self }
  end

  def portfolio
    self.funding_rounds.map { |funding_rnd| funding_rnd.startup }.uniq
  end

  def biggest_investment
    max_inv = 0
    output = nil
    self.funding_rounds.each { |funding_rnd|
      investment = funding_rnd.investment
      if investment > max_inv
        max_inv = investment
        output = funding_rnd
      end
    }
    output
  end

  def invested(domain)
    total_inv_amt = 0
    self.funding_rounds.each { |funding_rnd|
      total_inv_amt += funding_rnd.investment if funding_rnd.startup.domain == domain
    }
    total_inv_amt
  end

end
