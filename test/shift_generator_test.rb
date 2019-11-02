require './test/test_helper'
require './lib/shift_generator'

class ShiftGeneratorTest < Minitest::Test

  def setup
    @shift_generator = ShiftGenerator.new
  end

  def test_it_exists
    assert_instance_of ShiftGenerator, @shift_generator
  end

  def test_it_can_add_two_numbers_as_ints_or_strings
    assert_equal 5, @shift_generator.add(2, 3)
    assert_equal 5, @shift_generator.add("2", "3")
    assert_equal 5, @shift_generator.add(2, "3")
  end

  def test_it_can_square_a_number
    assert_equal 12148227961, @shift_generator.square(110219)
  end
end
