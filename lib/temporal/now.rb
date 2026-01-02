# frozen_string_literal: true

require "time"

module Temporal
  class Now
    def self.time_zone_id = "UTC"

    def self.instant
      Temporal::Instant.new(now.to_f)
    end

    def self.plain_date_iso(tz = nil)
      t = now(tz)
      Temporal::PlainDate.new(t.year, t.month, t.day)
    end

    def self.plain_date_time_iso(tz = nil)
      t = now(tz)
      Temporal::PlainDateTime.new(t.year, t.month, t.day, t.hour, t.min, t.sec)
    end

    def self.plain_time_iso(tz = nil)
      t = now(tz)
      Temporal::PlainTime.new(t.hour, t.min, t.sec)
    end

    def self.zoned_date_time_iso(tz = "UTC")
      Temporal::ZonedDateTime.new(now(tz).to_f, tz: validate_timezone(tz))
    end

    def self.now(tz = nil)
      if tz
        Time.now(in: validate_timezone(tz))
      else
        Time.now
      end
    end

    ISO_TZ_OFFSET    = /[+-]\d\d:?\d\d/ #  +12:34   -12:34   +1234   -1234
    ENDLINE_OFFSET   = /#{ISO_TZ_OFFSET}$/o #  +12:34$  -12:34$  +1234$  -1234$
    BRACKETED_OFFSET = /\[(#{ISO_TZ_OFFSET})\]/o # [+12:34] [-12:34] [+1234] [-1234]
    IANA_TZ          = /\[(\w+)\]/               # [ISO]

    def self.validate_timezone(value)
      value = value.downcase if value.respond_to? :downcase

      case value
      in "a".."i" | "k".."z"
        value.upcase
      in "utc" | "UTC" | /z$/
        "UTC"
      in IANA_TZ
        value[IANA_TZ, 1]
      in BRACKETED_OFFSET
        value[BRACKETED_OFFSET, 1]
      in ENDLINE_OFFSET
        value[ENDLINE_OFFSET]
      else
        raise RangeError, "Invalid value `#{value}` for timezone"
      end
    end
  end
end
