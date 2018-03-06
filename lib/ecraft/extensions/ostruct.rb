require 'ostruct'

class ::OpenStruct
  def to_json(*_args)
    marshal_dump.to_json
  end
end
