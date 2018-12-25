module HDeck
  class Card
    attr_accessor :name, :desc, :morality

    def initialize(args)
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def to_s
      "#{name} (#{morality})\n#{desc}"
    end
  end
end
