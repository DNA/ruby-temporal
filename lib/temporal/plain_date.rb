# frozen_string_literal: true

module Temporal
  class PlainDate
    attr_reader :year, :month, :day, :calendar_id

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

    def initialize(year, month, day, calendar_id = nil)
      self.year = year
      self.month = month
      self.day = day
      @calendar_id = calendar_id || :iso8601

      raise RangeError if min_date_overflow? || max_date_overflow?
    end

    def month_code = :"#{format("M%02d", month)}"

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

    def min_date_overflow?
      return false unless year <= -271_821

      limit = format("-%<year>06d-%<month>02d-%<day>02d", year: @year.abs, month: @month, day: @day)

      limit <= "-271821-04-18"
    end

    def max_date_overflow?
      @year >= 275_760 &&
        @month >= 9 &&
        @day >= 14
    end
  end
end
