# frozen_string_literal: true

module Temporal
  class PlainDateTime
    def initialize(year, month, day, hour = 0, minute = 0, second = 0,
                   millisecond = 0, microsecond = 0, nanosecond = 0,
                   calendar_id: nil)
      @date = PlainDate.new(year, month, day, calendar_id: calendar_id)
      @time = PlainTime.new(hour, minute, second, millisecond, microsecond, nanosecond)
    end

    def year        = @date.year
    def month       = @date.month
    def day         = @date.day
    def era         = @date.era
    def era_year    = @date.era_year
    def month_code  = @date.month_code

    def hour        = @time.hour
    def minute      = @time.minute
    def second      = @time.second
    def millisecond = @time.millisecond
    def microsecond = @time.microsecond
    def nanosecond  = @time.nanosecond
    def calendar_id = @date.calendar_id
  end
end
