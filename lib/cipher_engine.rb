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

  def self.get_key_permutations(keys)
    keys.map do |key|
      [
        key.to_s.prepend("0"), (key + 27).to_s, (key + 54).to_s, (key + 81).to_s
      ].reject { |key| key.length > 2 }
    end
  end

  def self.find_original_keys(perms)
    originals = []
    perms[0].each do |perm_1|
      # Does a matching permutation exist on 2nd array? If not, next.
      unless perms[1].any? { |perm| perm[0] == perm_1[-1] }
        next
      else
        # If so, save found permutation as 2nd.
        perm_2 = perms[1].find { |perm| perm[0] == perm_1[-1] }
        # Does a matching permutation exist on 3rd array? If not, next.
        unless perms[2].any? { |perm| perm[0] == perm_2[-1] }
          next
        else
          # If so, save found permutation as 3rd.
          perm_3 = perms[2].find { |perm| perm[0] == perm_2[-1] }
          # Does a matching permutation exist on 4th array? If not, next.
          unless perms[3].any? { |perm| perm[0] == perm_3[-1] }
            next
          else
            # If so, save as 4th to results array and begin backing out.
            originals[3] = perms[3].find { |perm| perm[0] == perm_3[-1] }
          end
        # Save third to results array, back out.
        originals[2] = perm_3
        end
      # Save second to results array, back out.
      originals[1] = perm_2
      end
      originals[0] = perm_1
    end
    originals
  end

  def self.crack_key(encrypted_msg, date)

    # 2. Do tree-like search: does number exist in next array
    # with matching first digit to last digit? If so, does that number have a
    # matchin number in next column? If so, does that one?...if not, go to next
    # number on first array and look again for a chain. Select the one that
    # goes all the way to 4th array.

    # 3. Recombine them into five-digit key.
  end
end
