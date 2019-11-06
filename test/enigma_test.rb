require './test/test_helper'
require './lib/cipher_engine'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_can_get_todays_date_as_string_of_digits
    today = mock('date object')
    Date.expects(:today).returns(today)
    today.expects(:strftime).returns("110219")
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
    expected = {
                  encryption: "keder ohulw!",
                  key: "02715",
                  date: "040895"
               }
    assert_equal expected, @enigma.encrypt("hello world!", "02715", "040895")
    assert_equal expected, @enigma.encrypt("hello world!", "02715")
    assert_equal expected, @enigma.encrypt("hello world!")
  end

  def test_it_can_decrypt_given_message_with_or_without_date
    @enigma.stubs(:get_todays_date).returns("040895")
    CipherEngine.stubs(:decrypt).with("keder ohulw!", "02715", "040895").returns("hello world!")
    expected = {
                  decryption: "hello world!",
                  key: "02715",
                  date: "040895"
               }
    assert_equal expected, @enigma.decrypt("keder ohulw!", "02715", "040895")
    assert_equal expected, @enigma.decrypt("keder ohulw!", "02715")
  end

  def test_it_can_crack_key_of_message_with_date_then_decrypt
    CipherEngine.stubs(:crack_key).returns("08304")
    CipherEngine.stubs(:decrypt).returns("hello world end")
    expected = {
                  decryption: "hello world end",
                  date: "291018",
                  key: "08304"
               }
    assert_equal expected, @enigma.crack("vjqtbeaweqihssi", "291018")
  end

  def test_it_can_generate_report_block
    expected = {
                  decryption: "hello world!",
                  key: "02715",
                  date: "040895"
               }
    pair = { decryption: "hello world!"}
    key = "02715"
    date = "040895"
    assert_equal expected, @enigma.generate_report_block(pair, key, date)
  end
end
