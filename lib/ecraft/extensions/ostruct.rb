require 'ostruct'

class ::OpenStruct
  def to_json(*a)
    p marshal_dump
    marshal_dump.to_json
  end
end
