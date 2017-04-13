require 'ostruct'

class ::OpenStruct
  def to_json(*a)
    marshal_dump.to_json
  end
end
