# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindate
# description: PlainDate constructor with non-integer arguments.
# includes: [compareArray.js, temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDate
  class Constructor < Minitest::Test
    def test_positive_fractional_numbers
      date = Temporal::PlainDate.new(2020.6, 11.7, 24.1)

      assert_plain_date(date, 2020, 11, :M11, 24, "positive fractional")
    end

    def test_negative_fractional
      date = Temporal::PlainDate.new(-2020.6, 11.7, 24.1)

      assert_plain_date(date, -2020, 11, :M11, 24, "negative fractional")
    end

    def test_nil_year
      date = Temporal::PlainDate.new(nil, 11, 24)

      assert_plain_date(date, 0, 11, :M11, 24, "nil")
    end

    def test_boolean
      date = Temporal::PlainDate.new(true, 11, 24)

      assert_plain_date(date, 1, 11, :M11, 24, "boolean")
    end

    def test_fractional_strings
      date = Temporal::PlainDate.new("2020.6", "11.7", "24.1")

      assert_plain_date(date, 2020, 11, :M11, 24, "fractional strings")
    end

    def test_symbols
      assert_raises(TypeError, "Symbol on year") { Temporal::PlainDate.new(:sym, 11, 24) }
      assert_raises(TypeError, "Symbol on month") { Temporal::PlainDate.new(2020, :sym, 24) }
      assert_raises(TypeError, "Symbol on day") { Temporal::PlainDate.new(2020, 11, :sym) }
    end
  end
end
