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
end
