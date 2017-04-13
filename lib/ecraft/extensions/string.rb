class ::String
  # These methods should not be used in new code
  # Instead use https://github.com/ecraft/ecraft.uxfactory.server/blob/master/documentation/upgrading-from-facets.md

  # require 'facets/string/camelcase' # You may or may not have the `require` in your code from before.
  # 'facets_string'.camelcase(:upper) # result: "FacetsString"
  def to_camelcase()
    separators = ['_', '\s']
    str = self.dup
    separators.each do |s|
      str = str.gsub(/(?:#{s}+)([a-z])/){ $1.upcase }
    end
    str = str.gsub(/(\A|\s)([a-z])/){ $1 + $2.upcase }
    return str
  end

  # require 'facets/string/snakecase' # You may or may not have the `require` in your code from before.
  # 'FacetsString'.snakecase # result: "facets_string"
  def to_snake_case()
    return self.gsub(/\B[A-Z]/, '_\&').downcase
  end

  # require 'active_support'
  # require 'active_support/core_ext/string/inflections'
  # 'Foo::Bar'.constantize # => Foo::Bar
  def to_class
    chain = self.split "::"
    klass = Kernel
    chain.each do |klass_string|
      klass = klass.const_get klass_string
    end
    klass.is_a?(Class) ? klass : nil
  rescue NameError
    nil
  end

  # require 'facets/string/roman' # You may or may not have the `require` in your code from before.
  # 'true'.to_b # result: true
  def to_bool
    !!(self =~ /^(true|t|yes|y|1)$/i)
  end
end
