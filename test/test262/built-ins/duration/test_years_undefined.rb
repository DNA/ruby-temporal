# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.duration
# description: Undefined arguments should be treated as zero.
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestDuration
  class Constructor < Minitest::Test
    def test_undefined_years_explicit
      args = []
      explicit = Temporal::Duration.new(*args, nil)

      assert_duration(explicit, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "explicit")
    end

    def test_undefined_years_implicit
      args = []
      implicit = Temporal::Duration.new(*args)

      assert_duration(implicit, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "implicit")
    end
  end
end
