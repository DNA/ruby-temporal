# frozen_string_literal: true

# Codes and maximum lengths of months in the ISO 8601 calendar.
ISO_MONTHS = [
  { month:  1, month_code: :M01, days_in_month: 31 },
  { month:  2, month_code: :M02, days_in_month: 29 },
  { month:  3, month_code: :M03, days_in_month: 31 },
  { month:  4, month_code: :M04, days_in_month: 30 },
  { month:  5, month_code: :M05, days_in_month: 31 },
  { month:  6, month_code: :M06, days_in_month: 30 },
  { month:  7, month_code: :M07, days_in_month: 31 },
  { month:  8, month_code: :M08, days_in_month: 31 },
  { month:  9, month_code: :M09, days_in_month: 30 },
  { month: 10, month_code: :M10, days_in_month: 31 },
  { month: 11, month_code: :M11, days_in_month: 30 },
  { month: 12, month_code: :M12, days_in_month: 31 },
].freeze

# List of known calendar eras and their possible aliases.
# https://tc39.es/proposal-intl-era-monthcode/#table-eras
# rubocop:disable Layout/HashAlignment
CALENDAR_ERAS = {
  buddhist:           [{ era: "be" }],
  coptic:             [{ era: "am" }],
  ethiopic:           [{ era: "aa",  aliases: ["mundi"] },
                       { era: "am",  aliases: ["incar"] }],
  ethioaa:            [{ era: "aa",  aliases: ["mundi"] }],
  gregory:            [{ era: "bce", aliases: ["bc"] },
                       { era: "ce",  aliases: ["ad"] }],
  hebrew:             [{ era: "am" }],
  indian:             [{ era: "shaka" }],
  islamic:            [{ era: "ah" },
                       { era: "bh" }],
  "islamic-civil":    [{ era: "bh" },
                       { era: "ah" }],
  "islamic-rgsa":     [{ era: "bh" },
                       { era: "ah" }],
  "islamic-tbla":     [{ era: "bh" },
                       { era: "ah" }],
  "islamic-umalqura": [{ era: "bh" },
                       { era: "ah" }],
  japanese:           [{ era: "bce", aliases: ["bc"] },
                       { era: "ce",  aliases: ["ad"] },
                       { era: "heisei" },
                       { era: "meiji" },
                       { era: "reiwa" },
                       { era: "showa" },
                       { era: "taisho" }],
  persian:            [{ era: "ap" }],
  roc:                [{ era: "roc",  aliases: ["minguo"] },
                       { era: "broc", aliases: %w[before-roc minguo-qian] }],
}.freeze
# rubocop:enable Layout/HashAlignment

# Return the canonical era code.
def canonicalize_calendar_era(calendar_id, era_name)
  calendar_id = case calendar_id
                in String | Symbol
                  calendar_id.to_sym
                else
                  raise ArgumentError,
                        "calendar must be string in canonicalize_calendar_era, #{calendar_id.class.name} received"
                end

  unless CALENDAR_ERAS.key?(calendar_id)
    raise ArgumentError, "eraName must be nil" unless era_name.nil?

    return nil
  end

  unless era_name.nil? || era_name.is_a?(String)
    raise ArgumentError,
          "eraName must be string or nil in canonicalize_calendar_era"
  end

  CALENDAR_ERAS[calendar_id].each do |era_info|
    era = era_info[:era]
    aliases = era_info[:aliases] || []
    return era if era == era_name || aliases.include?(era_name)
  end

  raise "Unsupported era name: #{era_name}"
end

# assert_duration(duration, years, ..., nanoseconds[, description]):
#
# Shorthand for asserting that each field of a Temporal::Duration is equal to
# an expected value.
def assert_duration(duration,
                    years, months, weeks, days,
                    hours, minutes, seconds,
                    milliseconds, microseconds, nanoseconds,
                    description = "")
  prefix = description.empty? ? "" : "#{description}: "

  assert_kind_of Temporal::Duration, duration, "#{prefix}instanceof"

  assert_equal years,        duration.years,        "#{prefix}years result:"
  assert_equal months,       duration.months,       "#{prefix}months result:"
  assert_equal weeks,        duration.weeks,        "#{prefix}weeks result:"
  assert_equal days,         duration.days,         "#{prefix}days result:"
  assert_equal hours,        duration.hours,        "#{prefix}hours result:"
  assert_equal minutes,      duration.minutes,      "#{prefix}minutes result:"
  assert_equal seconds,      duration.seconds,      "#{prefix}seconds result:"
  assert_equal milliseconds, duration.milliseconds, "#{prefix}milliseconds result:"
  assert_equal microseconds, duration.microseconds, "#{prefix}microseconds result:"
  assert_equal nanoseconds,  duration.nanoseconds,  "#{prefix}nanoseconds result"
end

# assert_date_duration(duration, years, months, weeks, days, [, description]):
#
# Shorthand for asserting that each date field of a Temporal::Duration is
# equal to an expected value.
def assert_date_duration(duration, years, months, weeks, days, description = "")
  prefix = description.empty? ? "" : "#{description}: "

  assert_kind_of Temporal::Duration, duration, "#{prefix}instanceof"

  assert_equal years,  duration.years,        "#{prefix}years result:"
  assert_equal months, duration.months,       "#{prefix}months result:"
  assert_equal weeks,  duration.weeks,        "#{prefix}weeks result:"
  assert_equal days,   duration.days,         "#{prefix}days result:"
  assert_equal 0,      duration.hours,        "#{prefix}hours result should be zero:"
  assert_equal 0,      duration.minutes,      "#{prefix}minutes result should be zero:"
  assert_equal 0,      duration.seconds,      "#{prefix}seconds result should be zero:"
  assert_equal 0,      duration.milliseconds, "#{prefix}milliseconds result should be zero:"
  assert_equal 0,      duration.microseconds, "#{prefix}microseconds result should be zero:"
  assert_equal 0,      duration.nanoseconds,  "#{prefix}nanoseconds result should be zero:"
end

# assert_durations_equal(actual, expected[, description]):
#
# Shorthand for asserting that each field of a Temporal::Duration is equal to
# the corresponding field in another Temporal::Duration.
def assert_durations_equal(actual, expected, description = "")
  prefix = description.empty? ? "" : "#{description}: "

  assert_kind_of Temporal::Duration, expected,
                 "#{prefix}expected value should be a Temporal::Duration"

  assert_duration(actual,
                  expected.years,
                  expected.months,
                  expected.weeks,
                  expected.days,
                  expected.hours,
                  expected.minutes,
                  expected.seconds,
                  expected.milliseconds,
                  expected.microseconds,
                  expected.nanoseconds,
                  description)
end

# assert_instants_equal(actual, expected[, description]):
#
# Shorthand for asserting that two Temporal::Instants are of the correct type
# and equal according to their equals() methods.
def assert_instants_equal(actual, expected, description = "")
  prefix = description.empty? ? "" : "#{description}: "

  assert_kind_of Temporal::Instant, expected,
                 "#{prefix}expected value should be a Temporal::Instant"

  assert_kind_of Temporal::Instant, actual, "#{prefix}instanceof"

  assert_equal actual, expected, "#{prefix}equals method"
end

# assert_plain_date(date, year, ..., day[, description[, era, era_year]]):
#
# Shorthand for asserting that each field of a Temporal::PlainDate is equal to
# an expected value. (Except the `calendar` property, since callers may want
# to assert either object equality with an object they put in there, or the
# value of date.calendar_id.)
def assert_plain_date(date, year, month, month_code, day,
                      description = "", era = nil, era_year = nil)
  prefix = description.empty? ? "" : "#{description}: "

  assert_kind_of Temporal::PlainDate, date, "#{prefix}instanceof"

  assert_nil(canonicalize_calendar_era(date.calendar_id, era), "#{prefix}era result:")
  assert_nil(canonicalize_calendar_era(date.calendar_id, date.era), "#{prefix}era result:")

  if era_year.nil?
    assert_nil date.era_year, "#{prefix}era_year result:"
  else
    assert_equal era_year, date.era_year, "#{prefix}era_year result:"
  end

  assert_equal year,       date.year,       "#{prefix}year result:"
  assert_equal month,      date.month,      "#{prefix}month result:"
  assert_equal month_code, date.month_code, "#{prefix}month_code result:"
  assert_equal day,        date.day,        "#{prefix}day result:"
end

# assert_plain_date_time(datetime, year, ..., nanosecond[, description[, era, era_year]]):
#
# Shorthand for asserting that each field of a Temporal::PlainDateTime is
# equal to an expected value. (Except the `calendar` property, since callers
# may want to assert either object equality with an object they put in there,
# or the value of datetime.calendar_id.)
def assert_plain_date_time(datetime,
                           year, month, month_code, day,
                           hour, minute, second,
                           millisecond, microsecond, nanosecond,
                           description = "", era = nil, era_year = nil)
  prefix = description.empty? ? "" : "#{description}: "

  assert_kind_of Temporal::PlainDateTime, datetime, "#{prefix}instanceof"

  assert_nil(canonicalize_calendar_era(datetime.calendar_id, era), "#{prefix}era result:")
  assert_nil(canonicalize_calendar_era(datetime.calendar_id, datetime.era), "#{prefix}era result:")

  if era_year.nil?
    assert_nil datetime.era_year, "#{prefix}era_year result:"
  else
    assert_equal era_year, datetime.era_year, "#{prefix}era_year result:"
  end

  assert_equal year,        datetime.year,        "#{prefix}year result:"
  assert_equal month,       datetime.month,       "#{prefix}month result:"
  assert_equal month_code,  datetime.month_code,  "#{prefix}month_code result:"
  assert_equal day,         datetime.day,         "#{prefix}day result:"
  assert_equal hour,        datetime.hour,        "#{prefix}hour result:"
  assert_equal minute,      datetime.minute,      "#{prefix}minute result:"
  assert_equal second,      datetime.second,      "#{prefix}second result:"
  assert_equal millisecond, datetime.millisecond, "#{prefix}millisecond result:"
  assert_equal microsecond, datetime.microsecond, "#{prefix}microsecond result:"
  assert_equal nanosecond,  datetime.nanosecond,  "#{prefix}nanosecond result:"
end

# assert_plain_date_times_equal(actual, expected[, description]):
#
# Shorthand for asserting that two Temporal::PlainDateTimes are of the correct
# type, equal according to their equals() methods, and additionally that
# their calendar internal slots are the same value.
def assert_plain_date_times_equal(actual, expected, description = "")
  prefix = description.empty? ? "" : "#{description}: "

  assert_kind_of Temporal::PlainDateTime, expected,
                 "#{prefix}expected value should be a Temporal::PlainDateTime"

  assert_kind_of Temporal::PlainDateTime, actual, "#{prefix}instanceof"

  assert_equal actual, expected, "#{prefix}equals method"
  assert_equal expected.calendar_id, actual.calendar_id, "#{prefix}calendar same value:"
end

# assert_plain_month_day(month_day, month_code, day[, description [, reference_iso_year]]):
#
# Shorthand for asserting that each field of a Temporal::PlainMonthDay is
# equal to an expected value. (Except the `calendar` property, since callers
# may want to assert either object equality with an object they put in there,
# or the value of month_day.calendar_id().)
def assert_plain_month_day(month_day, month_code, day, description = "", reference_iso_year = 1972)
  prefix = description.empty? ? "" : "#{description}: "
  iso_year = month_day.to_s(calendar_name: "always").split("-")[0].to_i

  assert_kind_of Temporal::PlainMonthDay, month_day, "#{prefix}instanceof"

  assert_equal month_code,         month_day.month_code, "#{prefix}month_code result:"
  assert_equal day,                month_day.day,        "#{prefix}day result:"
  assert_equal reference_iso_year, iso_year,             "#{prefix}reference_iso_year result:"
end

# assert_plain_time(time, hour, ..., nanosecond[, description]):
#
# Shorthand for asserting that each field of a Temporal::PlainTime is equal to
# an expected value.
def assert_plain_time(time, hour, minute, second,
                      millisecond, microsecond, nanosecond, description = "")
  prefix = description.empty? ? "" : "#{description}: "

  assert_kind_of Temporal::PlainTime, time, "#{prefix}instanceof"

  assert_equal hour,        time.hour,        "#{prefix}hour result:"
  assert_equal minute,      time.minute,      "#{prefix}minute result:"
  assert_equal second,      time.second,      "#{prefix}second result:"
  assert_equal millisecond, time.millisecond, "#{prefix}millisecond result:"
  assert_equal microsecond, time.microsecond, "#{prefix}microsecond result:"
  assert_equal nanosecond,  time.nanosecond,  "#{prefix}nanosecond result:"
end

# assert_plain_times_equal(actual, expected[, description]):
#
# Shorthand for asserting that two Temporal::PlainTimes are of the correct
# type and equal according to their equals() methods.
def assert_plain_times_equal(actual, expected, description = "")
  prefix = description.empty? ? "" : "#{description}: "

  assert_kind_of Temporal::PlainTime, expected,
                 "#{prefix}expected value should be a Temporal::PlainTime"
  assert_kind_of Temporal::PlainTime, actual, "#{prefix}instanceof"

  assert_equal actual, expected, "#{prefix}equals method"
end

# assert_plain_year_month(year_month, year, month, month_code[, description[, era, era_year, reference_iso_day]]):
#
# Shorthand for asserting that each field of a Temporal::PlainYearMonth is
# equal to an expected value. (Except the `calendar` property, since callers
# may want to assert either object equality with an object they put in there,
# or the value of year_month.calendar_id.)
#
# Pass nil as the reference_iso_day if you don't want to give it explicitly.
# In that case, the expected reference_iso_day will be computed using PlainDate
# and only verified for consistency, not for equality with a specific value.
def assert_plain_year_month(year_month, year, month, month_code,
                            description = "", era = nil, era_year = nil,
                            reference_iso_day = 1)
  prefix = description.empty? ? "" : "#{description}: "

  unless reference_iso_day.is_a?(Integer) || reference_iso_day.nil?
    raise ArgumentError,
          "assert_plain_year_month() reference_iso_day argument should be a number or nil, not #{reference_iso_day}"
  end

  assert_kind_of Temporal::PlainYearMonth, year_month, "#{prefix}instanceof"

  assert_nil(canonicalize_calendar_era(year_month.calendar_id, era), "#{prefix}era result:")
  assert_nil(canonicalize_calendar_era(year_month.calendar_id, year_month.era), "#{prefix}era result:")

  if era_year.nil?
    assert_nil year_month.era_year, "#{prefix}era_year result:"
  else
    assert_equal era_year, year_month.era_year, "#{prefix}era_year result:"
  end

  assert_equal year,       year_month.year,       "#{prefix}year result:"
  assert_equal month,      year_month.month,      "#{prefix}month result:"
  assert_equal month_code, year_month.month_code, "#{prefix}month_code result:"

  iso_day = year_month.to_s(calendar_name: :always).split(/[-\[]/)[-3].to_i

  expected_iso_day = reference_iso_day || year_month
                     .to_plain_date(day: 1)
                     .with_calendar("iso8601").day

  assert_equal expected_iso_day, iso_day, "#{prefix}reference_iso_day result:"
end

# assert_zoned_date_times_equal(actual, expected[, description]):
#
# Shorthand for asserting that two Temporal::ZonedDateTimes are of the correct
# type, equal according to their equals() methods, and additionally that
# their time zones and calendar internal slots are the same value.
def assert_zoned_date_times_equal(actual, expected, description = "")
  prefix = description.empty? ? "" : "#{description}: "

  assert_kind_of Temporal::ZonedDateTime, expected,
                 "#{prefix}expected value should be a Temporal::ZonedDateTime"
  assert_kind_of Temporal::ZonedDateTime, actual, "#{prefix}instanceof"

  assert_equal actual,                expected,            "#{prefix}equals method"
  assert_equal expected.time_zone_id, actual.time_zone_id, "#{prefix}time zone same value:"
  assert_equal expected.calendar_id,  actual.calendar_id,  "#{prefix}calendar same value:"
end

# assert_unreachable(description):
#
# Helper for asserting that code is not executed.
def assert_unreachable(description = nil)
  message = "This code should not be executed"
  message = "#{message}: #{description}" if description
  raise message
end

# PlainMonthDay strings that are not valid.
def plain_month_day_strings_invalid
  [
    "11-18junk",
    "11-18[u-ca=gregory]",
    "11-18[u-ca=hebrew]",
    "11-18[U-CA=iso8601]",
    "11-18[u-CA=iso8601]",
    "11-18[FOO=bar]",
    "-999999-01-01[u-ca=gregory]",
    "-999999-01-01[u-ca=chinese]",
    "+999999-01-01[u-ca=gregory]",
    "+999999-01-01[u-ca=chinese]",
  ]
end

# PlainMonthDay strings that are valid and that should produce October 1st.
def plain_month_day_strings_valid
  [
    "10-01",
    "1001",
    "1965-10-01",
    "1976-10-01T152330.1+00:00",
    "19761001T15:23:30.1+00:00",
    "1976-10-01T15:23:30.1+0000",
    "1976-10-01T152330.1+0000",
    "19761001T15:23:30.1+0000",
    "19761001T152330.1+00:00",
    "19761001T152330.1+0000",
    "+001976-10-01T152330.1+00:00",
    "+0019761001T15:23:30.1+00:00",
    "+001976-10-01T15:23:30.1+0000",
    "+001976-10-01T152330.1+0000",
    "+0019761001T15:23:30.1+0000",
    "+0019761001T152330.1+00:00",
    "+0019761001T152330.1+0000",
    "1976-10-01T15:23:00",
    "1976-10-01T15:23",
    "1976-10-01T15",
    "1976-10-01",
    "--10-01",
    "--1001",
    "-999999-10-01",
    "-999999-10-01[u-ca=iso8601]",
    "+999999-10-01",
    "+999999-10-01[u-ca=iso8601]",
  ]
end

# PlainTime strings that may be mistaken for PlainMonthDay or
# PlainYearMonth strings, and so require a time designator.
def plain_time_strings_ambiguous
  ambiguous_strings = [
    "2021-12", # ambiguity between YYYY-MM and HHMM-UU
    "2021-12[-12:00]", # ditto, TZ does not disambiguate
    "1214",     # ambiguity between MMDD and HHMM
    "0229",     #   ditto, including MMDD that doesn't occur every year
    "1130",     #   ditto, including DD that doesn't occur in every month
    "12-14",    # ambiguity between MM-DD and HH-UU
    "12-14[-14:00]", # ditto, TZ does not disambiguate
    "202112", # ambiguity between YYYYMM and HHMMSS
    "202112[UTC]", # ditto, TZ does not disambiguate
  ]
  # Adding a calendar annotation to one of these strings must not cause
  # disambiguation in favour of time.
  strings_with_calendar = ambiguous_strings.map { |s| "#{s}[u-ca=iso8601]" }
  ambiguous_strings + strings_with_calendar
end

# PlainTime strings that are of similar form to PlainMonthDay and
# PlainYearMonth strings, but are not ambiguous due to components that
# aren't valid as months or days.
def plain_time_strings_unambiguous
  [
    "2021-13",          # 13 is not a month
    "202113",           #   ditto
    "2021-13[-13:00]",  #   ditto
    "202113[-13:00]",   #   ditto
    "0000-00",          # 0 is not a month
    "000000",           #   ditto
    "0000-00[UTC]",     #   ditto
    "000000[UTC]",      #   ditto
    "1314",             # 13 is not a month
    "13-14",            #   ditto
    "1232",             # 32 is not a day
    "0230",             # 30 is not a day in February
    "0631",             # 31 is not a day in June
    "0000",             # 0 is neither a month nor a day
    "00-00", #   ditto
  ]
end

# PlainYearMonth-like strings that are not valid.
def plain_year_month_strings_invalid
  [
    "2020-13",
    "1976-11[u-ca=gregory]",
    "1976-11[u-ca=hebrew]",
    "1976-11[U-CA=iso8601]",
    "1976-11[u-CA=iso8601]",
    "1976-11[FOO=bar]",
    "+999999-01",
    "-999999-01",
  ]
end

# PlainYearMonth-like strings that are valid and should produce November
# 1976 in the ISO 8601 calendar.
def plain_year_month_strings_valid
  [
    "1976-11",
    "1976-11-10",
    "1976-11-01T09:00:00+00:00",
    "1976-11-01T00:00:00+05:00",
    "197611",
    "+00197611",
    "1976-11-18T15:23:30.1-02:00",
    "1976-11-18T152330.1+00:00",
    "19761118T15:23:30.1+00:00",
    "1976-11-18T15:23:30.1+0000",
    "1976-11-18T152330.1+0000",
    "19761118T15:23:30.1+0000",
    "19761118T152330.1+00:00",
    "19761118T152330.1+0000",
    "+001976-11-18T152330.1+00:00",
    "+0019761118T15:23:30.1+00:00",
    "+001976-11-18T15:23:30.1+0000",
    "+001976-11-18T152330.1+0000",
    "+0019761118T15:23:30.1+0000",
    "+0019761118T152330.1+00:00",
    "+0019761118T152330.1+0000",
    "1976-11-18T15:23",
    "1976-11-18T15",
    "1976-11-18",
  ]
end

# PlainYearMonth-like strings that are valid and should produce November of
# the ISO year -9999.
def plain_year_month_strings_valid_negative_year
  [
    "-009999-11",
  ]
end
