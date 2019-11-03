require './lib/cipher_engine'
require 'date'

class Enigma

  def get_todays_date
    Date.new.strftime("%m%d%y")
  end

  def generate_key
    rand(99999).to_s.rjust(5, "0")
  end

  def encrypt(message, key = generate_key, date = get_todays_date)
    encrypted_message = CipherEngine.encrypt(message, key, date)
    {
      encryption: encrypted_message,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = get_todays_date)
    decrypted_message = CipherEngine.decrypt(message, key, date)
    {
      decryption: decrypted_message,
      key: key,
      date: date
    }
  end
end
