require './test/test_helper'
require './lib/command_line_interface'

class CommandLineInterfaceTest < Minitest::Test
  def setup
    @command_line = CommandLineInterface.new
  end

  def test_it_exists
    assert_instance_of CommandLineInterface, @command_line
  end

  def test_it_can_parse_argv
    placeholder_input = ["message.txt", "encrypted.txt", "82648", "240818"]
    expected = { input_path: "message.txt",
                 output_path: "encrypted.txt",
                 key: "82648",
                 date: "240818" }
    assert_equal expected, @command_line.parse_argv(placeholder_input)
  end
end
