module HDeck
  class Harrow
    attr_accessor :harrow_data

    def initialize
      @harrow_data = JSON.parse(File.read('harrow.json'))
    end

    def cards
      cards = []
      harrow_data.keys.each do |key|
        cards << harrow_data[key]["cards"]
      end
      cards.flatten
    end
  end
end
