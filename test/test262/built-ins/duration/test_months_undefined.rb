# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.duration
# esid: sec-temporal.duration
# description: Undefined arguments should be treated as zero.
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestDuration
  class Constructor < Minitest::Test
    def test_undefined_months_explicit
      args = [1]
      explicit = Temporal::Duration.new(*args, nil)

      assert_duration(explicit, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, "explicit")
    end

    def test_undefined_months_implicit
      args = [1]
      implicit = Temporal::Duration.new(*args)

      assert_duration(implicit, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, "implicit")
    end
  end
end
