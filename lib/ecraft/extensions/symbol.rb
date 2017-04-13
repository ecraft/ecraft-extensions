class ::Symbol
  def to_json(options = {})
    "\"#{self.to_s}\""
  end
end
