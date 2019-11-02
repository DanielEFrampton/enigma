class ShiftGenerator

  def add(addend_1, addend_2)
    addend_1.to_i + addend_2.to_i
  end

  def square(number)
    number.to_i * number.to_i
  end

  def get_last_four_of(number)
    number.to_s.slice(-4, 4)
  end

  def split_into_keys(number)
    number.chars.each_cons(2).map { |pair| pair.join.to_i }
  end

  def generate_offsets(date)
    get_last_four_of(square(date))
  end

  def add_offsets_to_keys(offsets, keys)
    offsets.chars.map.with_index { |char, ind| char.to_i + keys[ind] }
  end

  def generate_shift_values(key, date)
  end
end
