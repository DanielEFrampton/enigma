require './lib/enigma'

class CommandLineInterface
  attr_reader :enigma, :input_path, :output_path, :key, :date

  def initialize(argv)
    @enigma = Enigma.new
    @input_path = argv[0]
    @output_path = argv[1]
    @key = argv[2]
    @date = argv[3]
  end

  def get_string_from_file(input_path)
    File.read(input_path)
  end

  def write_string_to_file(output_path, string)
    File.write(output_path, string)
  end

  def print_terminal_report
    puts "Created '#{output_path}' with the key #{key} and date #{date}"
  end
end
