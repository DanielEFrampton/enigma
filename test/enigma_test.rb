require './test/test_helper'
require './lib/cipher_engine'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_get_todays_date_as_string_of_digits
    placeholder_date = Date.new(2019,11,2)
    Date.expects(:new).returns(placeholder_date)
    assert_equal "110219", @enigma.get_todays_date
  end

  def test_it_can_generate_key_randomly
    srand(1111)
    assert_equal "68325", @enigma.generate_key
  end

  def test_it_can_encrypt_message_with_or_without_date_and_or_key
    @enigma.stubs(:generate_key).returns("02715")
    @enigma.stubs(:get_todays_date).returns("040895")
    CipherEngine.stubs(:encrypt).with("hello world!", "02715", "040895").returns("keder ohulw!")
    assert_equal "keder ohulw!", @enigma.encrypt("hello world!", "02715", "040895")
    assert_equal "keder ohulw!", @enigma.encrypt("hello world!", "02715")
    assert_equal "keder ohulw!", @enigma.encrypt("hello world!")
  end

  def test_it_can_decrypt_given_message_with_or_without_date
    @enigma.stubs(:get_todays_date).returns("040895")
    CipherEngine.stubs(:decrypt).with("keder ohulw!", "02715", "040895").returns("hello world!")
    assert_equal "hello world!", @enigma.decrypt("keder ohulw!", "02715", "040895")
    assert_equal "hello world!", @enigma.decrypt("keder ohulw!", "02715")
  end
end
