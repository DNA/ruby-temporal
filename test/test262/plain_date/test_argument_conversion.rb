# frozen_string_literal: true

require_relative "plain_date_helper"

# PlainDate constructor with non-integer arguments
#
# @note test262 info
#   original: test/built-ins/Temporal/PlainDate/argument-convert.js
#   esid: sec-temporal.plaindate
#   description: PlainDate constructor with non-integer arguments.
#   includes: [compareArray.js, temporalHelpers.js]
#   features: [Temporal]
class Temporal::PlainDate::ArgumentConversion < Minitest::Test
  {
    positive_fractional: [2020.6, 11.7, 24.1, 2020],
    negative_fractional: [-2020.6, 11.7, 24.1, -2020],
    fractional_strings: ["2020.6", "11.7", "24.1", 2020],
    nil_year: [nil, 11, 24, 0],
    boolean_true: [true, 11, 24, 1],
    boolean_false: [false, 11, 24, 0],
  }.each do |name, data|
    define_method("test_#{name}") do
      year, month, day, expected_year = data

      assert_valid_plain_date(year, month, day, expected_year, 11, 24)
    end
  end

  def test_raises_on_symbol
    assert_raises(TypeError) { Temporal::PlainDate.new(:foo, 11, 24) }
    assert_raises(TypeError) { Temporal::PlainDate.new(2020, :foo, 24) }
    assert_raises(TypeError) { Temporal::PlainDate.new(2020, 11, :foo) }
  end

  def test_raises_on_non_convertible_string
    assert_raises(TypeError) { Temporal::PlainDate.new("aff", 11, 24) }
    assert_raises(TypeError) { Temporal::PlainDate.new(2020, "aff", 24) }
    assert_raises(TypeError) { Temporal::PlainDate.new(2020, 11, "aff") }
  end
end
