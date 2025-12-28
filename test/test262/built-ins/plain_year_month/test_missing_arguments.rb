# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainyearmonth
# description: RangeError thrown after processing given args when invoked without all required args
# includes: [compareArray.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainYearMonth
  class Constructor < Minitest::Test
    def test_missing_arguments
      assert_raises(ArgumentError) { Temporal::PlainYearMonth.new }
    end
  end
end
