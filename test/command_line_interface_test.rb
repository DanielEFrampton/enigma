require './test/test_helper'
require './lib/command_line_interface'
require './lib/enigma'

class CommandLineInterfaceTest < Minitest::Test
  def setup
    @placeholder_input = ["message.txt", "encrypted.txt", "82648", "240818"]
    @command_line = CommandLineInterface.new(placeholder_input)
  end

  def test_it_exists
    assert_instance_of CommandLineInterface, @command_line
  end

  def test_it_initializes_with_enigma_instance
    assert_instance_of Enigma, @command_line.enigma
  end

  def test_it_initializes_with_attributes_from_argv
    assert_equal @placeholder_input[0], @command_line.input_path
    assert_equal @placeholder_input[1], @command_line.output_path
    assert_equal @placeholder_input[2], @command_line.key
    assert_equal @placeholder_input[3], @command_line.date
  end
end
