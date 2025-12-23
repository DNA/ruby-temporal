# frozen_string_literal: true

module Temporal
  class Duration
    attr_reader :year, :month, :day, :hour, :minute, :second, :microsecond

    def initialize(year, month, day, hour, minute, second, microsecond)
      @year = year
      @month = month
      @day = day
      @hour = hour
      @minute = minute
      @second = second
      @microsecond = microsecond
    end
  end
end
