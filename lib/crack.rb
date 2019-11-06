require './lib/command_line_interface'

cli = CommandLineInterface.new(ARGV, true)
cli.crack_sequence
