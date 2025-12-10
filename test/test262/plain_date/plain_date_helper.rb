# frozen_string_literal: true

require "temporal/plain_date"

def assert_valid_plain_date( # rubocop:disable Metics/ParameterLists
  year,
  month,
  day,
  expected_year = year,
  expected_month = month,
  expected_day = day,
  calendar_id: nil,
  expected_calendar_id: nil
)
  subject = Temporal::PlainDate.new(year, month, day)
  expected_calendar = expected_calendar_id || calendar_id || :iso8601

  assert_equal(expected_calendar, subject.calendar_id)
  assert_equal(expected_year, subject.era_year)
  assert_equal(expected_year, subject.year)
  assert_equal(:"#{format("M%02d", expected_month)}", subject.month_code)
  assert_equal(expected_month, subject.month)
  assert_equal(expected_day, subject.day)
end
