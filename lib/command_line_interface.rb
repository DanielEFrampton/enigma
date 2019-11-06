require './lib/enigma'

class CommandLineInterface
  attr_reader :input_path, :output_path, :key, :date, :message, :enigma

  def initialize(argv, crack = false)
    @input_path = argv[0]
    @output_path = argv[1]
    @key = crack ? nil : argv[2]
    @date = crack ? argv[2] : argv[3]
    @message = File.read(input_path).chomp
    @enigma = Enigma.new
  end

  def write_string_to_file(output_path, string)
    File.write(output_path, string)
  end

  def print_terminal_report(crack = false)
    puts "Created '#{output_path}' with the " +
    "#{"cracked " if crack}key #{key} and date #{date}"
  end

  def update_attributes(enigma_report)
    @key = enigma_report[:key]
    @date = enigma_report[:date]
  end

  def encryption_sequence
    enigma_report = @enigma.encrypt(@message)
    update_attributes(enigma_report)
    write_string_to_file(@output_path, enigma_report[:encryption])
    print_terminal_report
  end

  def decryption_sequence
    enigma_report = @enigma.decrypt(@message, @key, @date)
    write_string_to_file(@output_path, enigma_report[:decryption])
    print_terminal_report
  end

  def crack_sequence
    enigma_report = @enigma.crack(@message, @date)
    write_string_to_file(@output_path, enigma_report[:decryption])
    print_terminal_report(true)
  end
end
