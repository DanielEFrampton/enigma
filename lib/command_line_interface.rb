require './lib/enigma'

class CommandLineInterface
  attr_reader :enigma

  def initialize
    @enigma = Enigma.new
  end

  def parse_argv(argv)
      {
        input_path: argv[0],
        output_path: argv[1]
      }
  end
end
