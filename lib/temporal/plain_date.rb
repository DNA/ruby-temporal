# frozen_string_literal: true

module Temporal
  class PlainDate
    attr_reader :year, :month, :day, :calendar_id

    def initialize(year, month, day, calendar_id: nil)
      @year = Units::Year.new(year)
      @month = Units::Month.new(month, @year)
      @day = Units::Day.new(day, @month)
      @month.lower = @day
      self.calendar_id = calendar_id
    end

    def month_code = :"#{format("M%02d", month)}"

    def era_year = year

    def leap_year? = (year % 4).zero?

    def add(hash = {}, **kwargs)
      raise ArgumentError unless hash.instance_of? Hash

      values = hash.merge kwargs
      raise ArgumentError if values.empty?

      valid_keys = %i[years months weeks days hours minutes
                      seconds milliseconds microseconds nanoseconds]
      raise ArgumentError unless values.keys.intersect? valid_keys

      @day += values[:days] || 0
      @month += values[:months] || 0
      @year += values[:years] || 0

      self
    end

    def ==(other)
      @year == other.year &&
        @month == other.month &&
        @day == other.day
    end

    private

    def calendar_id=(value)
      value = case value
              in Symbol then value
              in String then value.to_sym
              in NilClass then :iso8601
              else raise RangeError
              end

      raise RangeError if value != :iso8601

      @calendar_id = value
    end
  end
end
