# frozen_string_literal: true

module Temporal::Units
  class Base
    include Comparable

    def initialize(value)
      self.value = value
    end

    def <=>(other) = @value <=> other

    def ==(other) = @value == other

    def +(other) = self.class.new(@value + other)

    def -(other) = self.class.new(@value - other)

    def to_s = @value.to_s

    def to_i = @value.to_i

    def to_f = @value.to_f

    def inspect
      "<#{self.class} @value=#{@value} @reference=#{@reference}>"
    end

    private

    def value=(value)
      raise TypeError, "Value for month must respond to #to_i" unless value.respond_to? :to_i

      value ||= 0

      @value = Float(value).to_i
    rescue ArgumentError
      raise TypeError, "Value can't be converted into a number"
    end
  end
end
