class ::Time
  def as_ms
    to_i * 1000 + usec / 1000
  end

  def to_json(*_a)
    iso8601.to_json
  end
end
