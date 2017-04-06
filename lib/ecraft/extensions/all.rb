# Requiring this file will activate _all_ the "core extensions" defined in ecraft-extensions. This may or may not be what you want.
# It is usually a better, safer approach to selectively require only the parts you know that you need, since core extensions _can_
# potentially cause conflicts with other libraries extending core classes (such as ActiveSupport).
require 'ecraft/extensions/bigdecimal'
require 'ecraft/extensions/date'
