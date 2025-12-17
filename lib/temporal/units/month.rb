# frozen_string_literal: true

module Temporal::Units
  class Month < Base
    attr_reader :lower

    DAYS_IN_MONTH = {
      1 => 31,
      2 => 28,
      3 => 31,
      4 => 30,
      5 => 31,
      6 => 30,
      7 => 31,
      8 => 31,
      9 => 30,
      10 => 31,
      11 => 30,
      12 => 31,
    }.freeze

    def initialize(value, upper)
      @upper = upper

      super(value)
    end

    def max_day = DAYS_IN_MONTH[@value]

    def lower=(unit)
      @lower = case unit
               in Integer, Float then Day.new(unit)
               in String then Day.new(unit.to_i)
               in Day then unit
               else raise ArgumentError, "Month lower unit must be a number or instance of Day"
               end
    end

    def +(other)
      sum = @value + other

      @value = case sum
               when (..0)
                 @upper = @upper.send(:-, 1, inplace: true)
                 12 - sum.abs
               when (13..)
                 @upper = @upper.send(:+, 1, inplace: true)
                 sum - 12
               else
                 sum
               end

      if @lower > max_day
        diff = max_day - @lower.to_i

        @lower += diff
      end

      self
    end

    def -(other)
      sum = @value - other

      @value = case sum
               when (..0)
                 @upper = @upper.send(:+, 1, inplace: true)
                 12 + sum
               when (13..)
                 @upper = @upper.send(:-, 1, inplace: true)
                 sum - 12
               else
                 sum
               end

      if @lower > max_day
        diff = max_day - @lower.to_i

        @lower += diff
      end

      self.class.new(sum, @upper)
    end

    private

    def value=(value)
      int = super

      case int.to_i
      when (..0)
        raise RangeError, "Month must be bigger than zero"
      when (13..)
        raise RangeError, "Month must be less than 13"
      else
        @value = int.to_i
      end
    end
  end
end
