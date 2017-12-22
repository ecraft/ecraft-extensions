class ::String
  # These methods should not be used in new code
  # Instead use the examples provided.

  # Don't use! Instead, write like this:
  #
  # require 'active_support'
  # require 'active_support/core_ext/string/inflections'
  #
  # 'ActiveSupportString'.underscore # result: "active_support_string"
  def to_snake_case
    gsub(/\B[A-Z]/, '_\&').downcase
  end

  def to_bool
    !self !~ /^(true|t|yes|y|1)$/i
  end
end
