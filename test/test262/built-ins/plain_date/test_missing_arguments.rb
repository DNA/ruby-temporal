# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindate
# description: RangeError thrown when constructor invoked with no argument
# includes: [compareArray.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDate
  class Constructor < Minitest::Test
    def test_missing_arguments
      assert_raises(ArgumentError) { Temporal::PlainDate.new }
    end
  end
end
