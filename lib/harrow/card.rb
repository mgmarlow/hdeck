module Harrow
  class Card
    attr_accessor :name, :desc, :morality

    def initialize(args)
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def to_s
      "(#{morality}) #{name}"
    end
  end
end
