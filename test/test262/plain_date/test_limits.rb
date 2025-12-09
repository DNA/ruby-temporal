# frozen_string_literal: true

require_relative "plain_date_helper"

# PlainDate throws a RangeError if any value is Infinity
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/limits.js
#   esid: sec-temporal.plaindate
#   description: Limits for the PlainDate constructor.
#   includes: [temporalHelpers.js]
#   features: [Temporal]
class Temporal::PlainDate::Limits < Minitest::Test
  def test_raise_after_max_negative_date
    assert_raises(RangeError) { Temporal::PlainDate.new(-271_821, 4, 18) }
  end

  def test_passes_on_max_negative_date
    assert_valid_plain_date(-271_821, 4, 19)
  end

  def test_raise_after_max_positive_date
    assert_raises(RangeError) { Temporal::PlainDate.new(275_760, 9, 14) }
  end

  def test_passes_on_max_positive_date
    assert_valid_plain_date(275_760, 9, 13)
  end
end
