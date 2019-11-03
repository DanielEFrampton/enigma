require './test/test_helper'
require './lib/enigma'

class CommandLineInterfaceTest < Minitest::Test
  def setup
    @command_line = CommandLineInterface.new
  end

  def test_it_exists
    assert_instance_of CommandLineInterface, @command_line
  end
end
