# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.zoneddatetime
# description: TypeError thrown when constructor invoked with no argument
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestZonedDateTime
  class Constructor < Minitest::Test
    def test_missing_arguments
      assert_raises(ArgumentError) { Temporal::ZonedDateTime.new }
    end
  end
end
