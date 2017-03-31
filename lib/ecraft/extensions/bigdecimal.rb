require 'bigdecimal'

# This extension assists BigDecimals coming out of Sequel resultsets with displaying as integers.
#
# By default, `BigDecimal` objects serialized to JSON or string format have two defects:
#
# 1. They get serialized in scientific notation (i.e. `1` gets serialized as `0.1E1`).
# 2. Even if you use the `to_s('F')` approach, `1` will get converted to `1.0`. This is useful to force the data to be converted
#    to a `Float` number if deserialized, but it causes practical problems since field like the M3 company number is normally
#    stored in a `DECIMAL(3)` field in the database. With libraries like [Sequel](http://sequel.jeremyevans.net), this causes
#    the data coming out from the database to be stored in a `BigDecimal`, even though it is really just a large integer.
#
# For our .NET-based applications to be able to parse such fields to an `int` field, we needed to strip away the `.0` part so that
# `BigDecimal(1).to_s` becomes simply `"1"`.
#
# More details and history around this can be found in this discussion: https://github.com/ecraft/ecraft-extensions/pull/1
class ::BigDecimal
  # The original (non-patched) `to_s` implementation.
  alias to_s_original to_s

  # Converts this object to JSON form, in the simplest string form possible, either looking like a `Float` or `Fixnum`.
  #
  # Values without any fraction digits will use `Fixnum` form, where values with a fractional part will use `Float` form.
  #
  # @return [String]
  def to_json(*_a)
    to_s
  end

  # Converts this object to the simplest string form possible, either looking like a `Float` or `Fixnum`.
  #
  # Values without any fraction digits will use `Fixnum` form, where values with a fractional part will use `Float` form.
  #
  # @param s [String] The format that should be used for the conversion. If provided, the original `to_s` implementation will be
  #   called using this parameter to provide the same semantics as the original method.
  # @return [String]
  def to_s(s = nil)
    if s.nil?
      to_s_original('F').gsub(/\.0$/, '')
    else
      to_s_original(s)
    end
  end
end
