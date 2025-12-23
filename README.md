# Ruby Temporal

This gem is a implementation of ECMAScript Temporal API.

## Specification

This gem aims to be a direct implementation of the original spec, with only small changes to adapt it to Ruby sintx and idioms.

To achieve this, I'm converting all specs from [test262 repo](https://github.com/tc39/test262), with the exception of languiage specific tests, like `prototype`, for example.

The planned tests are the following:

| Original test path | Path on gem tests|
| --- | --- |
| test/built-ins/Temporal | test/test262/built-ins/ |
| test/intl402/Temporal   | test/test262/intl402/   |

The following test may be added later if relevant:
```
test/built-ins/Date/prototype/toTemporalInstant
test/staging/Temporal
test/staging/sm/Temporal
test/staging/sm/Date/to-temporal-instant.js
test/staging/Intl402/Temporal
harness/sm/non262-Temporal-PlainMonthDay-shell.js
harness/temporalHelpers.js
```

## Installation

```bash
bundle add temporal
# or
gem install temporal
```

## Usage

Instructions will be made after the API is defined and implemented

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DNA/ruby-temporal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/DNA/ruby-temporal/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruby::Temporal project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/DNA/ruby-temporal/blob/main/CODE_OF_CONDUCT.md).
