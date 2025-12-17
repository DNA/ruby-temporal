# frozen_string_literal: true

require_relative "../../plain_date_helper"

# PlainDate#add arguments must have at least one valid key
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/prototype/add/argument-invalid-property.js
#   esid: sec-temporal.plaindate.prototype.add
#   description: temporalDurationLike object must contain at least one correctly spelled property
#   features: [Temporal]
module Temporal::TestPlainDate
  class Add < Minitest::Test
    def subject
      Temporal::PlainDate.new(2000, 5, 2)
    end

    def test_hash_empty
      assert_raises(ArgumentError) { subject.add({}) }
    end

    def test_hash_unknown_keys
      assert_raises(ArgumentError) { subject.add({ nonsense: true }) }

      assert_raises(ArgumentError) { subject.add({ sign: 1 }) }
    end
  end
end
