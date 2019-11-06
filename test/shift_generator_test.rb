require './test/test_helper'
require './lib/shift_generator'

class ShiftGeneratorTest < Minitest::Test

  def setup
    @shift_generator = ShiftGenerator.new
  end

  def test_it_exists
    assert_instance_of ShiftGenerator, @shift_generator
  end

  def test_it_can_square_a_number_as_ints_or_strings
    assert_equal 12148227961, ShiftGenerator.square(110219)
    assert_equal 12148227961, ShiftGenerator.square("110219")
  end

  def test_it_can_get_last_four_digits_of_given_integer
    assert_equal "7961", ShiftGenerator.get_last_four_of(12148227961)
    assert_equal "7961", ShiftGenerator.get_last_four_of("12148227961")
  end

  def test_it_can_split_five_digit_string_into_four_two_digit_number_keys
    assert_equal [12, 23, 34, 45], ShiftGenerator.split_into_keys("12345")
    assert_equal [0, 1, 10, 0], ShiftGenerator.split_into_keys("00100")
  end

  def test_it_can_add_offsets_to_keys
    args = ["7961", [12, 23, 34, 45]]
    assert_equal [19, 32, 40, 46], ShiftGenerator.add_offsets_to_keys(*args)
    args_2 = ["0101", [0, 1, 10, 0]]
    assert_equal [0, 2, 10, 1], ShiftGenerator.add_offsets_to_keys(*args_2)
  end

  def test_it_can_generate_offsets_from_date
    assert_equal "7961", ShiftGenerator.generate_offsets("110219")
  end

  def test_it_can_generate_shift_values_from_key_number_and_date
    args = ["12345", "110219"]
    assert_equal [19, 32, 40, 46], ShiftGenerator.generate_shift_values(*args)
  end
end
