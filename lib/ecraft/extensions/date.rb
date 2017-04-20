# This is a bit crazy, but we need it because the 'json/add/core' adds a really weird serialization of date fields.
# It looks like this: {"json_class":"Date","y":2000,"m":1,"d":1,"sg":2299161.0}
class ::Date
  def to_json(*_args)
    format('"%d-%02d-%02d"', year, month, day)
  end
end
