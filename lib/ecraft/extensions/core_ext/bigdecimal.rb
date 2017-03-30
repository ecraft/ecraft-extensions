require 'bigdecimal'

class ::BigDecimal
  alias to_s_original to_s

  def to_json(*_a)
    to_s_original('F').gsub(/\.0$/, '')
  end

  def to_s(s = nil)
    if s.nil?
      to_s_original('F').gsub(/\.0$/, '')
    else
      to_s_original(s)
    end
  end
end
