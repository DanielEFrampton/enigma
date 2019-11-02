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
end
