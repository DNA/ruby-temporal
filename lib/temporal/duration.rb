# frozen_string_literal: true

module Temporal
  class Duration
    UNIT_LIMITS = {
      year:    4_294_967_296,         #  2**32
      month:   4_294_967_296,         #  2**32
      week:    4_294_967_296,         #  2**32
      days:    104_249_991_375,       # (2**53 / 86_400.0).ceil | 2**53 is based
      hours:   2_501_999_792_984,     # (2**53 / 86_400.0).ceil | on EcmaScript
      minutes: 150_119_987_579_017,   # (2**53 / 86_400.0).ceil | Number.MAX_SAFE_INTEGER
      seconds: 9_007_199_254_740_992, #  2**53
    }.freeze

    UNITS = %i[years months days
               hours minutes seconds weeks
               milliseconds microseconds nanoseconds].freeze

    attr_reader(*UNITS)

    def initialize(years = nil, months = nil, weeks = nil, days = nil,
                   hours = nil, minutes = nil, seconds = nil,
                   milliseconds = nil, microseconds = nil, nanoseconds = nil)
      values = [years, months, weeks, days,
                hours, minutes, seconds,
                milliseconds, microseconds, nanoseconds]
      values.map! do |v|
        case v
        in 0 then nil
        in String then v.to_i
        in Numeric then v
        else nil
        end
      end

      values.uniq!.compact!

      unless values.all?(&:positive?) || values.all?(&:negative?)
        raise RangeError, "Can't mix positive and negative numbers"
      end

      self.years        = years
      self.months       = months
      self.weeks        = weeks
      self.days         = days
      self.hours        = hours
      self.minutes      = minutes
      self.seconds      = seconds
      self.milliseconds = milliseconds
      self.microseconds = microseconds
      self.nanoseconds  = nanoseconds

      overboard
    end

    def total(unit)
      if unit == :seconds
        (days * 86_400) +
          (hours * 3600) +
          (minutes * 60) +
          seconds +
          (((milliseconds * 1_000_000) +
            (microseconds * 1_000) +
            nanoseconds
           ) / 1_000_000_000.0)
      else
        0
      end
    end

    private

    def overboard
      overboard_unit(:nanoseconds,  :microseconds, 1000)
      overboard_unit(:microseconds, :milliseconds, 1000)
      overboard_unit(:milliseconds, :seconds,      1000)
      overboard_unit(:seconds,      :minutes,      60)
      overboard_unit(:minutes,      :hours,        60)
      overboard_unit(:hours,        :days,         24)
    end

    def overboard_unit(from, to, mod)
      from_value   = send(from)
      to_value     = send(to)
      carry, value = from_value.abs.divmod(mod)

      if from_value.negative?
        value = -value
        carry = -carry
      end

      send(:"#{from}=", value)
      send(:"#{to}=", to_value + carry) unless carry.zero?
    end

    def years=(value)
      @years = convert_type(value, 4_294_967_296)
    end

    def months=(value)
      @months = convert_type(value, 4_294_967_296)
    end

    def weeks=(value)
      @weeks = convert_type(value, 4_294_967_296)
    end

    def days=(value)
      @days = convert_type(value, 104_249_991_375)
    end

    def hours=(value)
      @hours = convert_type(value, 2_501_999_792_984)
    end

    def minutes=(value)
      @minutes = convert_type(value, 150_119_987_579_017)
    end

    def seconds=(value)
      @seconds = convert_type(value, 9_007_199_254_740_992)
    end

    def milliseconds=(value)
      @milliseconds = convert_type(value)
    end

    def microseconds=(value)
      @microseconds = convert_type(value)
    end

    def nanoseconds=(value)
      @nanoseconds = convert_type(value)
    end

    def convert_type(value, limit = nil)
      value = case value
              in Float
                raise RangeError, "Can't use fractional values" unless value == value.truncate

                value.to_i
              in Numeric then value.to_i
              in NilClass then 0
              in String then Integer(value)
              else raise TypeError
              end

      if limit
        raise RangeError if value >= limit
        raise RangeError if value <= -limit
      end

      value
    end
  end
end
