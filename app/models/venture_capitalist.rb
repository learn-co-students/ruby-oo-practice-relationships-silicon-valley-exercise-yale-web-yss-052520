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

end
