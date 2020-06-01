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
    end
end
