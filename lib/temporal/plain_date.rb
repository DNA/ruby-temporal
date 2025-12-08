# frozen_string_literal: true

module Temporal
  class PlainDate
    attr_reader :year, :month, :day

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

    def initialize(year, month, day)
      self.year = year
      self.month = month
      self.day = day
    end

    def month_code = :"M#{month}"

    def era_year = year

    def leap_year? = (year % 4).zero?

    private

    def year=(value)
      @year = case value
              in true then 1
              in false | nil then 0
              else Float(value).to_i
              end
    rescue ArgumentError, NoMethodError => e
      raise TypeError, "Year can't be converted into integer", cause: e
    end

    def month=(value)
      value = Float(value).to_i

      raise RangeError if value < 1 || value > 12

      @month = value
    rescue ArgumentError, NoMethodError => e
      raise TypeError, "Month can't be converted into integer", cause: e
    end

    def day=(value)
      value = Float(value).to_i

      raise RangeError if value < 1

      max_days = case [value, leap_year?]
                 in [2, true] then 29
                 in [2, false] then 28
                 else DAYS_IN_MONTH[month]
                 end

      raise RangeError, "day #{value} > #{max_days} " if value > max_days

      @day = value
    rescue ArgumentError, NoMethodError => e
      raise TypeError, "Day can't be converted into integer", cause: e
    end
  end
end
