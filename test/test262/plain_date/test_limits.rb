# frozen_string_literal: true

require "temporal/plain_date"

require "test_helper"

# PlainDate throws a RangeError if any value is Infinity
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/limits.js
#   esid: sec-temporal.plaindate
#   description: Limits for the PlainDate constructor.
#   includes: [temporalHelpers.js]
#   features: [Temporal]

# assert.throws(RangeError, () => new Temporal.PlainDate(-271821, 4, 18), "min");
# assert.throws(RangeError, () => new Temporal.PlainDate(275760, 9, 14), "max");
# TemporalHelpers.assertPlainDate(new Temporal.PlainDate(-271821, 4, 19),
#   -271821, 4, "M04", 19, "min");
# TemporalHelpers.assertPlainDate(new Temporal.PlainDate(275760, 9, 13),
#   275760, 9, "M09", 13, "max");

class Temporal::PlainDate::Limits < Minitest::Test
  def test_raise_after_max_negative_date
    assert_raises(RangeError) { Temporal::PlainDate.new(-271_821, 4, 18) }
  end

  def test_passes_on_max_negative_date
    subject = Temporal::PlainDate.new(-271_821, 4, 19)

    assert_equal(:iso8601, subject.calendar_id)
    assert_equal(-271_821, subject.era_year)
    assert_equal(-271_821, subject.year)
    assert_equal(:M04, subject.month_code)
    assert_equal(4, subject.month)
    assert_equal(19, subject.day)
  end

  def test_raise_after_max_positive_date
    assert_raises(RangeError) { Temporal::PlainDate.new(275_760, 9, 14) }
  end

  def test_passes_on_max_positive_date
    subject = Temporal::PlainDate.new(275_760, 9, 13)

    assert_equal(:iso8601, subject.calendar_id)
    assert_equal(275_760, subject.era_year)
    assert_equal(275_760, subject.year)
    assert_equal(:M09, subject.month_code)
    assert_equal(9, subject.month)
    assert_equal(13, subject.day)
  end
end
