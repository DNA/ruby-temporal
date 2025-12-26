# frozen_string_literal: true

module Temporal::Units
  class Month < Base
    attr_reader :lower

    def initialize(value, year = nil)
      @year = year

      super(value)
    end

    def on_leap_year? = @year.nil? || (@year.respond_to?(:leap?) && @year.leap?)

    def max_day
      case [@value, on_leap_year?]
      in [1 | 3 | 5 | 7 | 8 | 10 | 12, *]
        31
      in [4 | 6 | 9 | 11, *]
        30
      in [2, true]
        29
      in [2, false]
        28
      end
    end

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
                 @year = @year.send(:-, 1, inplace: true)
                 12 - sum.abs
               when (13..)
                 @year = @year.send(:+, 1, inplace: true)
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
                 @year = @year.send(:+, 1, inplace: true)
                 12 + sum
               when (13..)
                 @year = @year.send(:-, 1, inplace: true)
                 sum - 12
               else
                 sum
               end

      if @lower > max_day
        diff = max_day - @lower.to_i

        @lower += diff
      end

      self.class.new(sum, @year)
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
