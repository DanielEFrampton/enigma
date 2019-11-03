require './lib/enigma'

class CommandLineInterface
  attr_reader :input_path, :output_path, :key, :date, :message

  def initialize(argv)
    @input_path = argv[0]
    @output_path = argv[1]
    @key = argv[2]
    @date = argv[3]
    @message = File.read(input_path)
  end

  def write_string_to_file(output_path, string)
    File.write(output_path, string)
  end

  def print_terminal_report
    puts "Created '#{output_path}' with the key #{key} and date #{date}"
  end

  def update_attributes(enigma_report)
    @key = enigma_report[:key]
    @date = enigma_report[:date]
  end

  def execute_encryption_sequence
    enigma_report = Enigma.encrypt(@message)
    update_attributes(enigma_report)
    write_string_to_file(@output_path, enigma_report[:encryption])
    print_terminal_report
  end

  def execute_decryption_sequence
    enigma_report = Enigma.decrypt(@message, @key, @date)
    write_string_to_file(@output_path, enigma_report[:decryption])
    print_terminal_report
  end
end
