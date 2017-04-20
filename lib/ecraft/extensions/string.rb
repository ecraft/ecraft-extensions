class ::String
  # These methods should not be used in new code
  # Instead use https://github.com/ecraft/ecraft.uxfactory.server/blob/master/documentation/upgrading-from-facets.md

  # require 'active_support'
  # require 'active_support/core_ext/string/inflections'
  #
  # 'active_support_string'.camelize # result: "ActiveSupportString"
  def to_camelcase
    separators = ['_', '\s']
    str = dup
    separators.each do |s|
      str = str.gsub(/(?:#{s}+)([a-z])/) { Regexp.last_match(1).upcase }
    end
    str = str.gsub(/(\A|\s)([a-z])/) { Regexp.last_match(1) + Regexp.last_match(2).upcase }
    str
  end

  # require 'active_support'
  # require 'active_support/core_ext/string/inflections'
  #
  # 'ActiveSupportString'.underscore # result: "active_support_string"
  def to_snake_case
    gsub(/\B[A-Z]/, '_\&').downcase
  end

  # require 'active_support'
  # require 'active_support/core_ext/string/inflections'
  # 'Foo::Bar'.constantize # => Foo::Bar
  def to_class
    chain = split '::'
    klass = Kernel
    chain.each do |klass_string|
      klass = klass.const_get klass_string
    end
    klass.is_a?(Class) ? klass : nil
  rescue NameError
    nil
  end

  def to_bool
    !self !~ /^(true|t|yes|y|1)$/i
  end
end
