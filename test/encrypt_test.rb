require './test/test_helper'
require './lib/command_line_interface'
require './lib/encrypt.rb'

class EncryptTest < Minitest::Test

  def setup
    @encrypt = Encrypt.new
  end

  def test_it_can_parse_argv_and_merge_with_parent
    placeholder_input = ["message.txt", "encrypted.txt"]
    expected = { input_path: "message.txt",
                 output_path: "encrypted.txt" }
    assert_equal expected, @encrypt.parse_argv(placeholder_input)
  end
end
