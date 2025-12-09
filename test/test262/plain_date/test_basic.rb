# frozen_string_literal: true

require "temporal/plain_date"

require "test_helper"

# Basic tests for the PlainDate constructor
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/basic.js
#   esid: sec-temporal.plaindate
#   description: Basic tests for the PlainDate constructor.
#   includes: [temporalHelpers.js]
#   features: [Temporal]
class Temporal::PlainDate::Basic < Minitest::Test
  def test_basic_assert_with_calendar
    subject = Temporal::PlainDate.new(2021, 12, 22, :iso8601)

    assert_equal(:iso8601, subject.calendar_id)
    assert_equal(2021, subject.era_year)
    assert_equal(2021, subject.year)
    assert_equal(:M12, subject.month_code)
    assert_equal(12, subject.month)
    assert_equal(22, subject.day)
  end

  def test_basic_assert_without_calendar
    subject = Temporal::PlainDate.new(2021, 12, 22)

    assert_equal(:iso8601, subject.calendar_id)
    assert_equal(2021, subject.era_year)
    assert_equal(2021, subject.year)
    assert_equal(:M12, subject.month_code)
    assert_equal(12, subject.month)
    assert_equal(22, subject.day)
  end
end
