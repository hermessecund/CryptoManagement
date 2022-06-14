class Coin
    attr_reader :name, :abbreviation, :operations

    def initialize(name, abbreviation)
        @name = name
        @abbreviation = abbreviation
        @operations = Array.new
    end

end