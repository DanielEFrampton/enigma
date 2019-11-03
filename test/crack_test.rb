require './test/test_helper'
require './lib/command_line_interface'
require './lib/crack.rb'

class CrackTest < Minitest::Test

  def setup
    @crack = Crack.new
  end

  def test_it_can_parse_argv_and_merge_with_parent
    placeholder_input = ["message.txt", "encrypted.txt", "82648", "240818"]
    expected = { input_path: "message.txt",
                 output_path: "encrypted.txt",
                 key: "82648",
                 date: "240818" }
    assert_equal expected, @crack.parse_argv(placeholder_input)
  end
end
