# frozen_string_literal: true

require "temporal/plain_date"
require_relative "../../test_helper"

module Temporal::TestPlainDate; end

def subject(year = 2000, month = 5, day = 2)
  Temporal::PlainDate.new(year, month, day)
end

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

def assert_plain_date_values(
  plain_date,
  year,
  month,
  month_code,
  day
)
  assert_equal(year, plain_date.era_year)
  assert_equal(year, plain_date.year)
  assert_equal(month, plain_date.month)
  assert_equal(month_code, plain_date.month_code)
  assert_equal(day, plain_date.day)
end
