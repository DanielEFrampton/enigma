require './lib/cipher_engine'
require 'date'

class Enigma

  def self.get_todays_date
    Date.today.strftime("%m%d%y")
  end

  def self.generate_key
    rand(99999).to_s.rjust(5, "0")
  end

  def self.encrypt(message, key = generate_key, date = get_todays_date)
    pair = {encryption: CipherEngine.encrypt(message, key, date)}
    generate_report_block(pair, key, date)
  end

  def self.decrypt(message, key, date = get_todays_date)
    pair = {decryption: CipherEngine.decrypt(message, key, date)}
    generate_report_block(pair, key, date)
  end

  def self.generate_report_block(pair, key, date)
    pair.merge({ key: key, date: date })
  end
end
