require './test/test_helper'
require './lib/command_line_interface'

class CommandLineInterfaceTest < Minitest::Test
  def setup
    @command_line = CommandLineInterface.new
  end

  def test_it_exists
    assert_instance_of CommandLineInterface, @command_line
  end
end
