require './test/test_helper'
require './lib/shift_generator'
require './lib/message_shifter'

class MessageShifterTest < Minitest::Test

  def setup
    @cipher_engine = MessageShifter.new
  end

  def test_it_exists
    assert_instance_of MessageShifter, @cipher_engine
  end

  def test_it_can_return_charset
    expected = ["a", "b", "c", "d", "e", "f", "g",
                "h", "i", "j", "k", "l", "m", "n", "o", "p",
                "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, MessageShifter.charset
    assert_equal 27, MessageShifter.charset.length
  end

  def test_it_can_change_to_index_value_of_a_character_on_charset
    assert_equal 0, MessageShifter.to_index("a")
    assert_equal 26, MessageShifter.to_index(" ")
  end

  def test_it_can_change_index_to_character_on_charset
    assert_equal "a", MessageShifter.to_char(0)
    assert_equal " ", MessageShifter.to_char(26)
  end

  def test_it_can_encrypt_given_message_using_key_and_date
    ShiftGenerator.expects(:generate_shift_values).returns([3, 27, 73, 20])
    args = ["hello world!", "02715", "040895"]
    assert_equal "keder ohulw!", MessageShifter.encrypt(*args)
  end

  def test_it_can_decrypt_given_message_using_key_and_date
    ShiftGenerator.expects(:generate_shift_values).returns([3, 27, 73, 20])
    args = ["keder ohulw!", "02715", "040895"]
    assert_equal "hello world!", MessageShifter.decrypt(*args)
  end
end
