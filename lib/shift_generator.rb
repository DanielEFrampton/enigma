class ShiftGenerator

  def self.add(addend_1, addend_2)
    addend_1.to_i + addend_2.to_i
  end

  def self.square(number)
    number.to_i * number.to_i
  end

  def self.get_last_four_of(number)
    number.to_s.slice(-4, 4)
  end

  def self.split_into_keys(number)
    number.chars.each_cons(2).map { |pair| pair.join.to_i }
  end

  def self.generate_offsets(date)
    get_last_four_of(square(date))
  end

  def self.add_offsets_to_keys(offsets, keys)
    offsets.chars.map.with_index { |char, ind| char.to_i + keys[ind] }
  end

  def self.generate_shift_values(key, date)
    add_offsets_to_keys(generate_offsets(date), split_into_keys(key))
  end
end
