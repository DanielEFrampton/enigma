require './lib/shift_generator'

class CipherEngine
  def self.charset
    ("a".."z").to_a << " "
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
    shifts = message.slice(-4, 4).chars.map.with_index do |encrypt_char, index|
      shift_between([" ", "e", "n", "d"][index], encrypt_char)
    end
    shifts.rotate!(4 - (message.length % 4))
  end

  def self.crack_keys(shifts, date)
    offsets = ShiftGenerator.generate_offsets(date)
    shifts.map.with_index { |shift, index| shift - offsets[index].to_i }
  end

  def self.crack_key(encrypted_msg, date)
    # 1. create collection of arrays for each key with all two-digit options which
    # equal % 27 == the original number. There are 3-4 for any given number,
    # four for all numbers 24 and under, 3 for 25, 26, 27, and 0.

    # 2. Do tree-like search: does number exist in next array
    # with matching first digit to last digit? If so, does that number have a
    # matchin number in next column? If so, does that one?...if not, go to next
    # number on first array and look again for a chain. Select the one that
    # goes all the way to 4th array.

    # 3. Recombine them into five-digit key.
  end
end
