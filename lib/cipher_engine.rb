require './lib/shift_generator'

class CipherEngine
  @@charset = ("a".."z").to_a << " "

  def self.charset
    @@charset
  end

  def self.encrypt(message, key, date)
    shift_values = ShiftGenerator.generate_shift_values(key, date)
    encrypted_chars = message.chars.collect_concat do |char|
      if charset.include?(char)
        encrypted_char = charset[(charset.index(char) + shift_values.first) % 27]
        shift_values.rotate!(1)
      else
        encrypted_char = char
      end
      encrypted_char
    end
    encrypted_chars.join
  end

  def self.decrypt(message, key, date)
  end
end
