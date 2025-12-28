# frozen_string_literal: true

module Temporal
  class PlainYearMonth
    attr_reader :year, :month, :calendar_id

    IMPLICIT_DAY = 1

    def initialize(year, month, day: nil, calendar_id: nil)
      @year = Units::Year.new(year)
      @month = Units::Month.new(month, @year)
      self.calendar_id = calendar_id

      return unless day

      @day = Units::Day.new(day, @month)
      @month.lower = @day
    end

    def day = @day || IMPLICIT_DAY

    def month_code = :"#{format("M%02d", month)}"

    def era = nil

    def era_year = nil

    def to_s(calendar_name: nil)
      if calendar_name == :always
        "%4d-%02d-%02d[u-ca=%s]" % [@year, @month, day, calendar_id]
      elsif day
        "%4d-%02d-%02d" % [@year, @month, day]
      else
        "%4d-%02d" % [@year, @month]
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
