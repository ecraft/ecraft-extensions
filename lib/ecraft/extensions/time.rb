require 'json'
require 'json/add/core'
require 'time'

class ::Time
  def as_ms
    to_i * 1000 + usec / 1000
  end

  def to_json(*_args)
    # Use the precision provided in our receiver, but only up to milliseconds at max. Objects lacking the fraction part
    # altogether will be serialized without fraction part using this algorithm.
    fraction_digits = [nsec.to_s.sub(/0+$/, '').length, 3].min
    iso8601(fraction_digits).to_json
  end
end
