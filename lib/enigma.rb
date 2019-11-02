require './lib/cipher_engine'
require 'date'

class Enigma

  def get_todays_date
    Date.new.strftime("%m%d%y")
  end

  def generate_key
    rand(99999).to_s.rjust(5, "0")
  end
end
