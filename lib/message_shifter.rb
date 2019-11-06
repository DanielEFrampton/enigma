require './lib/shift_generator'
require './lib/indexable'

class MessageShifter
  extend Indexable

  def self.shift_character(char, shift, operation)
    charset[to_index(char).send(operation, shift) % 27]
  end

  def self.shift_message(message, key, date, operation)
    shift_values = ShiftGenerator.generate_shift_values(key, date)
    message.chars.reduce("") do |new_string, char|
      next new_string + char if !charset.include?(char)
      shift_values.rotate!(1) unless new_string.empty?
      new_string.concat(shift_character(char, shift_values.first, operation))
    end
  end

  def self.encrypt(message, key, date)
    shift_message(message, key, date, :+)
  end

  def self.decrypt(message, key, date)
    shift_message(message, key, date, :-)
  end
end
