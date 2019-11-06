require './lib/message_shifter'
require './lib/key_cracker'
require 'date'

class Enigma
  def get_todays_date
    Date.today.strftime("%m%d%y")
  end

  def generate_key
    rand(99999).to_s.rjust(5, "0")
  end

  def encrypt(message, key = generate_key, date = get_todays_date)
    pair = {encryption: MessageShifter.encrypt(message, key, date)}
    generate_report_block(pair, key, date)
  end

  def decrypt(message, key, date = get_todays_date)
    pair = {decryption: MessageShifter.decrypt(message, key, date)}
    generate_report_block(pair, key, date)
  end

  def crack(message, date = get_todays_date)
    key = KeyCracker.crack_key(message, date)
    decrypt(message, key, date)
  end

  def generate_report_block(pair, key, date)
    pair.merge({ key: key, date: date })
  end
end
