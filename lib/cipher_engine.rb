require './lib/shift_generator'

class CipherEngine
  @@charset = ("a".."z").to_a << " "

  def self.charset
    @@charset
  end

  def self.shift_character(char, shift, type)
    if type == :encrypt
      charset[(charset.index(char) + shift) % 27]
    elsif type == :decrypt
      charset[(charset.index(char) - shift) % 27]
    end
  end

  def self.engine(message, key, date, type)
    shift_values = ShiftGenerator.generate_shift_values(key, date)
    message.chars.reduce("") do |new_string, char|
      next new_string + char if !charset.include?(char)
      shift_values.rotate!(1) unless new_string.empty?
      new_string.concat(shift_character(char, shift_values.first, type))
    end
  end

  def self.encrypt(message, key, date)
    engine(message, key, date, :encrypt)
  end

  def self.decrypt(message, key, date)
    engine(message, key, date, :decrypt)
  end
end
