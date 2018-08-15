[![Build Status](https://travis-ci.org/ecraft/ecraft-extensions.svg?branch=master)](https://travis-ci.org/ecraft/ecraft-extensions) [![Gem Version](https://badge.fury.io/rb/ecraft-extensions.svg)](https://badge.fury.io/rb/ecraft-extensions)

# Ecraft::Extensions

This code contains some useful extension methods to various Ruby classes.

It also contains a mixin in the `Ecraft::Extensions::Mixins` module.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ecraft-extensions'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ecraft-extensions

## Usage

```ruby
# To load a specific extension:
require 'ecraft/extensions/bigdecimal'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.

Then, run `rake spec` to run the tests.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ecraft/extensions. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

### Documentation

We strive to write documentation inline in [YARD](http://yardoc.org) format.

### Preview documentation locally

```
bundle exec yard server -r
```

Check the locally served documentation at [http://localhost:8808/](http://localhost:8808/).

### Releasing a new version

- Bump the version in `version.rb`
- Create the tag:
  ```
  $ git release v1.0.x
  ```
- Build the `.gem` file and push it to Rubygems.org:
  ```shell
  $ bundle exec rake build release
  ```
- Generate the changelog (`cargo install changelog-rs && changelog-rs .`) and
  copy the relevant lines to [the releases page](https://github.com/ecraft/ecraft-extensions/releases).

### License

MIT
