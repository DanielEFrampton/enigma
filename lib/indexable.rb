module Indexable
  def charset
    ("a".."z").to_a << " "
  end

  def to_index(char)
    charset.index(char)
  end

  def to_char(index)
    charset[index]
  end
end
