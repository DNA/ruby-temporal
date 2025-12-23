# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "temporal"
require_relative "harness"

require "minitest/autorun"
require "minitest/reporters"

# Minitest.load :ci
# Minitest.load :documentation # Don't run on minitest 6
# Minitest.load :minitest_reporter
Minitest.load :pride
# Minitest.load :rails
# Minitest.load :server
# Minitest.load :simplecov
# Minitest.load :test_prof

Minitest::Reporters.use! [
  # Minitest::Reporters::ProgressReporter.new, # => Fuubar-like output with a progress bar
  # Minitest::Reporters::SpecReporter.new, # => Turn-like output that reads like a spec
  # Minitest::Reporters::DefaultReporter.new,  # => Redgreen-capable version of standard Minitest reporter
  # Minitest::Reporters::RubyMateReporter.new, # => Simple reporter designed for RubyMate
  # Minitest::Reporters::RubyMineReporter.new, # => Reporter designed for RubyMine IDE and TeamCity CI server
  # Minitest::Reporters::JUnitReporter.new,    # => JUnit test reporter designed for JetBrains TeamCity
  # Minitest::Reporters::MeanTimeReporter.new, # => Produces a report summary showing the slowest running tests
  # Minitest::Reporters::HtmlReporter.new,     # => Generates an HTML report of the test results
]
