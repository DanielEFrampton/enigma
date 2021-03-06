require './lib/shift_generator'
require './lib/indexable'

class KeyCracker
  extend Indexable

  def self.get_shift_between(decrypt_char, encrypt_char)
    ((27 - to_index(decrypt_char)) + to_index(encrypt_char)) % 27
  end

  def self.crack_shifts(message)
    message.slice(-4, 4).chars.map.with_index do |encrypt_char, index|
      get_shift_between(" end"[index], encrypt_char)
    end.rotate(4 - (message.gsub(/[^a-z\s]/, '').length % 4))
  end

  def self.crack_keys(shifts, date)
    offsets = ShiftGenerator.generate_offsets(date)
    shifts.map.with_index do |shift, index|
      shifted_number = (shift - offsets[index].to_i)
      shifted_number > 0 ? shifted_number : shifted_number + 27
    end
  end

  def self.get_key_permutations(keys)
    keys.map do |key|
      [ (key.to_s.length == 1 ? key.to_s.prepend("0") : key.to_s),
        (key + 27).to_s, (key + 54).to_s, (key + 81).to_s
      ].reject { |key_perm| key_perm.length > 2 }
    end
  end

  def self.find_original_keys(perms)
    perms[0].each do |perm_1|
      keys = [perm_1]
      keys[1] = perms[1].find { |perm| perm[0] == keys[0][-1] } || next
      keys[2] = perms[2].find { |perm| perm[0] == keys[1][-1] } || next
      keys[3] = perms[3].find { |perm| perm[0] == keys[2][-1] } || next
      return keys
    end
  end

  def self.combine_keys(keys)
    "#{keys[0]}#{keys[1][-1]}#{keys[2][-1]}#{keys[3][-1]}"
  end

  def self.crack_key(encrypted_msg, date)
    keys = crack_keys(crack_shifts(encrypted_msg), date)
    combine_keys(find_original_keys(get_key_permutations(keys)))
  end
end
