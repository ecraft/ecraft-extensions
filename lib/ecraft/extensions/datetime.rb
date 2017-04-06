class ::DateTime
  def to_json(*_args)
    '"' + to_s + '"'
  end
end
