[![Build Status](https://travis-ci.com/ecraft/ecraft-extensions.svg?token=BUqjqARNkptMDoMbPtFS&branch=master)](https://travis-ci.com/ecraft/ecraft-extensions)

# Ecraft::Extensions

This code contains some useful extension methods to various Ruby classes.

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

Preferred approach:

```ruby
# To load a specific extension:
require 'ecraft/extensions/bigdecimal'
```

Not-so-preferred approach:

```ruby
 # To load _all_ core extensions. USE WITH GREAT CARE, since this could cause conflicts with other libraries.
require 'ecraft/extensions/all'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ecraft/extensions. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

### Documentation

We strive to write documentation inline in [YARD](http://yardoc.org) format.

### Previewing documentation locally
```
bundle exec yard server -r
```

Check the locally served documentation at http://localhost:8808/

### License

MIT
