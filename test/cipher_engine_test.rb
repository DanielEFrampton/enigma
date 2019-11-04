require './test/test_helper'
require './lib/shift_generator'
require './lib/cipher_engine'

class CipherEngineTest < Minitest::Test

  def setup
    @cipher_engine = CipherEngine.new
  end

  def test_it_exists
    assert_instance_of CipherEngine, @cipher_engine
  end

  def test_it_has_class_variable_holding_charset
    expected = ["a", "b", "c", "d", "e", "f", "g",
                "h", "i", "j", "k", "l", "m", "n", "o", "p",
                "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, CipherEngine.charset
    assert_equal 27, CipherEngine.charset.length
  end

  def test_it_can_get_index_value_of_a_character_on_charset
    assert_equal 0, CipherEngine.get_index("a")
    assert_equal 27, CipherEngine.get_index(" ")
  end

  def test_it_can_encrypt_given_message_using_key_and_date
    ShiftGenerator.expects(:generate_shift_values).returns([3, 27, 73, 20])
    assert_equal "keder ohulw!", CipherEngine.encrypt("hello world!", "02715", "040895")
  end

  def test_it_can_decrypt_given_message_using_key_and_date
    ShiftGenerator.expects(:generate_shift_values).returns([3, 27, 73, 20])
    assert_equal "hello world!", CipherEngine.decrypt("keder ohulw!", "02715", "040895")
  end

  def test_it_can_get_shift_value_from_encrypted_and_decrypted_charactes
    skip
    assert_equal 3, CipherEngine.shift_between("a", "d")
    assert_equal 4, CipherEngine.shift_between("z", "d")
  end
end
