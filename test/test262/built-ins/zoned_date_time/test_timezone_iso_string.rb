# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.zoneddatetime.constructor
# description: An ISO string is not valid input for a constructor's time zone param
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestZonedDateTime
  class Timezone < Minitest::Test
    def test_invalid_iso_string
      assert_raises(
        ArgumentError,
        "An ISO string is not a valid calendar ID for constructor parameter"
      ) { Temporal::ZonedDateTime.new(0, tz: "1997-12-04T12:34[+01:00]") }
    end
  end
end
