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

end
