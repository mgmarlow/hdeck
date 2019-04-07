module Harrow
  # An individual Harrow card unit, described on this page:
  # https://pathfinder.fandom.com/wiki/List_of_harrow_cards
  class Card
    attr_accessor :name, :desc, :morality

    def initialize(args)
      args.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def to_s
      "(#{morality}) #{name}"
    end
  end
end
