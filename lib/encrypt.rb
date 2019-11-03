require './lib/command_line_interface'

cli = CommandLineInterface.new(ARGV)
cli.encryption_sequence
