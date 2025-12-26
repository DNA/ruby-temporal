# frozen_string_literal: true

module Temporal
  class PlainMonthDay
    attr_reader :month, :day, :calendar_id

    IMPLICIT_YEAR = 1972

    def initialize(month, day, year: nil, calendar_id: nil)
      @year = (Units::Year.new(year) if year)
      @month = Units::Month.new(month, @year)
      @day = Units::Day.new(day, @month)
      @month.lower = @day
      self.calendar_id = calendar_id
    end

    def year
      @year || IMPLICIT_YEAR
    end

    def month_code = :"#{format("M%02d", month)}"

    def era = nil

    def to_s(calendar_name: nil)
      if calendar_name == :always
        "#{year}-#{@month}-#{@day}[u-ca=#{calendar_id}]"
      elsif year
        "#{year}-#{@month}-#{@day}"
      else
        "#{@month}-#{@day}"
      end
    end

    private

    def calendar_id=(value)
      value = case value
              in Symbol then value
              in String then value.downcase.to_sym
              in NilClass then :iso8601
              else raise RangeError
              end

      raise RangeError if value != :iso8601

      @calendar_id = value
    end
  end
end
