require './lib/shift_generator'

class CipherEngine
  @@charset = ("a".."z").to_a << " "
  @@known_end = " end".chars

  def self.charset
    @@charset
  end

  def self.shift_character(char, shift, operation)
    charset[to_index(char).send(operation, shift) % 27]
  end

  def self.to_index(char)
    charset.index(char)
  end

  def self.to_char(index)
    charset[index]
  end

  def self.engine(message, key, date, operation)
    shift_values = ShiftGenerator.generate_shift_values(key, date)
    message.chars.reduce("") do |new_string, char|
      next new_string + char if !charset.include?(char)
      shift_values.rotate!(1) unless new_string.empty?
      new_string.concat(shift_character(char, shift_values.first, operation))
    end
  end

  def self.encrypt(message, key, date)
    engine(message, key, date, :+)
  end

  def self.decrypt(message, key, date)
    engine(message, key, date, :-)
  end

  def self.shift_between(decrypt_char, encrypt_char)
    ((27 - to_index(decrypt_char)) + to_index(encrypt_char)) % 27
  end

  def self.crack_shifts(message)
    message.slice(-4, 4).split.map
  end

  def self.crack_key(encrypted_msg, date)
    ShiftGenerator.generate_offsets(date)
  end
end
