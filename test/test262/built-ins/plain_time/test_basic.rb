# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaintime
# description: Basic tests for the PlainTime constructor.
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainTime
  class Constructor < Minitest::Test
    def test_basic
      args = [15, 23, 30, 123, 456, 789]
      plain_time = Temporal::PlainTime.new(*args)

      assert_plain_time(plain_time, *args)
    end
  end
end
