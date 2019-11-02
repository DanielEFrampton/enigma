# Enigma Project

### Plan

- Enigma class
  - `@character_set = ("a".."z").to_a << " "`

  - `get_todays_date`
  - `get_random_five_digits`

  - `.encrypt(message, key = get_random_five_digits, date = get_todays_date)`
  - `.decrypt(ciphertext, key, date = get_todays_date)`
  - `crack(ciphertext, date)` (Optional)

- CommandLineInterface class

  - `parse_argv(ARGV)` #=> info hash
  - `get_string_from_file(input_file_path)`
  - `write_string_to_file(output_file_path)`
  - `print_terminal_report(target_path, key, date)`

- ShiftGenerator class
  - `generate_shift_values(key, date)`
  - `add(addend1, addend2)`
  - `get_last_four_of(number)`
  - `square(number)`
  - `split_into_keys(five_digit_number)`
  - `add_offsets_to_keys(offsets, keys)`

- CipherEngine
  - `.encrypt(message, key, date)` (Encryptor class?)
  - `.decrypt(ciphertext, key, date)`(Encryptor class?)
  - `encrypt_character(character, shift_value)` (Encryptor class?)
  - `decrypt_character(character, shift_value)` (Decryptor class?)
