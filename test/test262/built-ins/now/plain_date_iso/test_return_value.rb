# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.plaindateiso
# description: Functions when time zone argument is omitted
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestPlainDateISO
  class Constructor < Minitest::Test
    def test_return
      subject = Temporal::Now.plain_date_iso

      assert_instance_of(Temporal::PlainDate, subject)

      assert_equal(:iso8601, subject.calendar_id, "calendar id should be iso8601")
    end
  end
end
