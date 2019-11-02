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
end
