require 'ostruct'

class ::OpenStruct
  def to_json(*_a)
    marshal_dump.to_json
  end
end
