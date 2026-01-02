# Ruby Temporal

This gem is a implementation of TC39 Temporal API.

## Specification

This gem aims to be a direct implementation from the original spec, with only small changes to adapt it to Ruby sinatx and idioms.

To achieve this, we are using as a base all specs from [test262 repo](https://github.com/tc39/test262). We converted their logic from JavaScript to Ruby using minitest with the exception of languiage specific tests, like `prototype`, for example.

The tests are being created using commit `d8d4c064` as reference. Changes from later commits will be added after the initial implementation is completed.

The planned tests are the following:

| Original test path | Path on gem tests|
| --- | --- |
| test/built-ins/Temporal | test/test262/built-ins/ |
| test/intl402/Temporal   | test/test262/intl402/   |

## Installation

```bash
bundle add temporal
# or
gem install temporal
```

## Usage

Instructions will be made after the API is defined and implemented.

The official usage reference from original implementation can be found on [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` or `minitest` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

The objective of initial development is to implement all test262 specs. We are doing it using TDD, without specific focus on being idiomatic, performant or DRY. Those are reserved for the next step in the project.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DNA/ruby-temporal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/DNA/ruby-temporal/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ruby-temporal project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/DNA/ruby-temporal/blob/main/CODE_OF_CONDUCT.md).
