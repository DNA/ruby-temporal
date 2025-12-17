# frozen_string_literal: true

module Temporal::Units
  class Day < Base
    def initialize(value, upper)
      @upper = upper

      super(value)
    end

    def max_value = @upper.max_day

    def over_value = max_value + 1

    def +(other)
      sum = @value + other

      @value = case sum
               when (..0)
                 @upper -= 1
                 max_value - sum.abs
               when (over_value..)
                 @upper += 1
                 sum - max_value + 1
               else
                 sum
               end
      self
    end

    def -(other)
      sum = @value - other

      @value = case sum
               when (..0)
                 @upper -= 1
                 max_value - sum.abs
               when (over_value..)
                 @upper += 1
                 sum - max_value
               else
                 sum
               end

      self
    end

    private

    def value=(value)
      int = super

      case int.to_i
      when (..0)
        raise RangeError, "Day must be bigger than zero"
      when (over_value...)
        raise RangeError, "Day #{int} for month #{@upper} can't be bigger than #{max_value}"
      else
        @value = int.to_i
      end
    end
  end
end
