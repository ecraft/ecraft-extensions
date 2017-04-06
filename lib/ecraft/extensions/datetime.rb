class ::DateTime
  def to_json(*args)
    '"' + to_s + '"'
  end
end
