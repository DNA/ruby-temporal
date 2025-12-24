# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime
# description: RangeError thrown after processing given args when invoked without all required args
# includes: [compareArray.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDateTime
  class Constructor < Minitest::Test
    def test_missing_arguments
      assert_raises(ArgumentError) { Temporal::PlainDateTime.new }
    end
  end
end
