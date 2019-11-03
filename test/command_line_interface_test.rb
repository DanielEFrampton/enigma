require './test/test_helper'
require './lib/command_line_interface'
require './lib/enigma'

class CommandLineInterfaceTest < Minitest::Test
  def setup
    File.expects(:read).with("message.txt").twice.returns("hello world!")
    @placeholder_input = ["message.txt", "encrypted.txt", "82648", "240818"]
    @command_line = CommandLineInterface.new(@placeholder_input)
    @input_2 = ["message.txt", "encrypted.txt"]
    @command_line_2 = CommandLineInterface.new(@input_2)
  end

  def test_it_exists
    assert_instance_of CommandLineInterface, @command_line
    assert_instance_of CommandLineInterface, @command_line_2
  end

  def test_it_initializes_with_attributes_from_argv
    assert_equal @placeholder_input[0], @command_line.input_path
    assert_equal @placeholder_input[1], @command_line.output_path
    assert_equal @placeholder_input[2], @command_line.key
    assert_equal @placeholder_input[3], @command_line.date
    assert_equal @input_2[0], @command_line_2.input_path
    assert_equal @input_2[1], @command_line_2.output_path
    assert_nil @command_line_2.key
    assert_nil @command_line_2.date
  end

  def test_it_reads_string_from_file_on_initialization
    assert_equal "hello world!", @command_line.message
  end

  def test_it_can_write_string_to_file
    File.expects(:write).with("encrypted.txt", "keder ohulw!")
    @command_line.write_string_to_file("encrypted.txt", "keder ohulw!")
  end

  def test_it_can_print_terminal_report
    expected = "Created 'encrypted.txt' with the key 82648 and date 240818\n"
    assert_output(expected) { @command_line.print_terminal_report }
  end

  def test_it_can_update_attributes_from_enigma_report
    report_block = {
                    encryption: "keder ohulw!",
                    key: "02715",
                    date: "040895"
                   }
    Enigma.expects(:encrypt).with("hello world!").returns(report_block)
    @command_line_2.update_attributes(report_block)
    assert_equal "02715", @command_line_2.key
    assert_equal "040895", @command_line_2.key
  end

  def test_it_can_execute_encryption_sequence
    skip
    report_block = {
                    encryption: "keder ohulw!",
                    key: "02715",
                    date: "040895"
                   }
    Enigma.expects(:encrypt).with("hello world!").returns(report_block)
  end
end
