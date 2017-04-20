class ::Symbol
  def to_json(_options = {})
    "\"#{self}\""
  end
end
