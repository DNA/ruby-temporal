# frozen_string_literal: true

require "time"

module Temporal
  MAX_TIMESTAMP = 8_640_000_000_000_000_000

  class Instant
    def initialize(timestamp)
      self.timestamp = timestamp
    end

    def epoch_milliseconds = (@timestamp / 1_000_000_000).truncate
    def epoch_nanoseconds =  @timestamp / 1_000

    private

    def timestamp=(value)
      value = Float(value)

      raise RangeError, "timestamp overflow"  if value >  MAX_TIMESTAMP
      raise RangeError, "timestamp underflow" if value < -MAX_TIMESTAMP

      @timestamp = value * 1_000
    rescue TypeError, ArgumentError => e
      raise TypeError, "Invalid string for timestamp", cause: e
    end
  end
end
