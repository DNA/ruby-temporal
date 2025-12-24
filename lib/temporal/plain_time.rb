# frozen_string_literal: true

module Temporal
  class PlainTime
    attr_reader :hour, :minute, :second, :millisecond, :microsecond, :nanosecond

    def initialize(hour = 0, minute = 0, second = 0,
                   millisecond = 0, microsecond = 0, nanosecond = 0)
      self.hour = hour
      self.minute = minute
      self.second = second
      self.millisecond = millisecond
      self.microsecond = microsecond
      self.nanosecond = nanosecond
    end

    def hour=(value)
      @hour = case value
              in (..-1)
                raise RangeError, "Hour can't be negative"
              in (24..)
                raise RangeError, "Hour can't be bigger than 23"
              else
                value.to_i
              end
    end

    def minute=(value)
      @minute = case value
                in (..-1)
                  raise RangeError, "Minute can't be negative"
                in (59..)
                  raise RangeError, "Minute can't be bigger than 59"
                else
                  value.to_i
                end
    end

    def second=(value)
      @second = case value
                in (..-1)
                  raise RangeError, "Second can't be negative"
                in (59..)
                  raise RangeError, "Second can't be bigger than 59"
                else
                  value.to_i
                end
    end

    def millisecond=(value)
      @millisecond = case value
                     in (..-1)
                       raise RangeError, "Millisecond can't be negative"
                     in (999..)
                       raise RangeError, "Millisecond can't be bigger than 999"
                     else
                       value.to_i
                     end
    end

    def microsecond=(value)
      @microsecond = case value
                     in (..-1)
                       raise RangeError, "Microsecond can't be negative"
                     in (999..)
                       raise RangeError, "Microsecond can't be bigger than 999"
                     else
                       value.to_i
                     end
    end

    def nanosecond=(value)
      @nanosecond = case value
                    in (..-1)
                      raise RangeError, "Nanosecond can't be negative"
                    in (999..)
                      raise RangeError, "Nanosecond can't be bigger than 999"
                    else
                      value.to_i
                    end
    end
  end
end
