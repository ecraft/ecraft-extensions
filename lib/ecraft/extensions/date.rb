# This is a bit crazy, but we need it because the 'json/add/core' adds a really weird serialization of date fields.
class ::Date
  def to_json(*args)
    sprintf('"%d-%02d-%02d"', year, month, day)
  end
end
