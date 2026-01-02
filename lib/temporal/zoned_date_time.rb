# frozen_string_literal: true

require "time"

module Temporal
  class ZonedDateTime
    MAX_TIMESTAMP = 864 * (10**19)
    MIN_TIMESTAMP = -MAX_TIMESTAMP

    attr_reader :calendar_id

    def initialize(timestamp, tz: "UTC", calendar_id: nil)
      raise RangeError, "Timestamp underflow" if timestamp < MIN_TIMESTAMP
      raise RangeError, "Timestamp overflow"  if timestamp > MAX_TIMESTAMP

      self.timezone = tz
      self.calendar_id = calendar_id

      seconds, nanosecond = timestamp.divmod(1_000_000_000)

      @time = Time.at(seconds, nanosecond, :nanosecond, in: tz)
      @timestamp = timestamp
    end

    def year        = @time.year
    def month       = @time.month
    def day         = @time.day
    def era         = @time.era
    def era_year    = @time.era_year
    def month_code = :"#{format("M%02d", @time.month)}"

    def hour        = @time.hour
    def minute      = @time.min
    def second      = @time.sec
    def millisecond = (@time.subsec.to_f * 1_000).to_i
    def microsecond = @time.usec % 1_000
    def nanosecond  = @time.nsec % 1_000

    def epoch_milliseconds = (@time.to_f * 1_000).to_i
    def epoch_nanoseconds = @timestamp

    def day_of_week = @time.wday
    def day_of_year = @time.yday
    def week_of_year = (@time.yday / 7) + 1
    def days_in_week = 7
    def days_in_month = 30
    def days_in_year = 366
    def months_in_year = 12
    def leap_year? = true
    def offset = "+00:00"
    def offset_nanoseconds = 0

    def time_zone_id = @timezone.upcase

    def to_s = "#{@time.inspect[..-5]}+00:00[UTC]".tr(" ", "T")

    private

    def timezone=(value)
      @timezone = case value
                  in "a".."i" | "k".."z" | "utc" | "UTC"
                    value.upcase
                  in /(\+|-)\d\d:\d\d/
                    value
                  else
                    raise RangeError, "Invalid value `#{value}` for timezone"
                  end
    end

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
