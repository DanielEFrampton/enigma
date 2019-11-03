require './test/test_helper'
require './lib/command_line_interface'
require './lib/enigma'

class CommandLineInterfaceTest < Minitest::Test
  def setup
    @command_line = CommandLineInterface.new
  end

  def test_it_exists
    assert_instance_of CommandLineInterface, @command_line
  end

  def test_it_initializes_with_enigma_instance
    assert_instance_of Enigma, @command_line.enigma
  end

  def test_it_can_parse_argv
    placeholder_input = ["message.txt", "encrypted.txt", "82648", "240818"]
    expected = { input_path: "message.txt",
                 output_path: "encrypted.txt" }
    assert_equal expected, @command_line.parse_argv(placeholder_input)
  end
end
