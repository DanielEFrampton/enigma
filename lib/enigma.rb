require './lib/cipher_engine'
require 'date'

class Enigma

  def get_todays_date
    Date.new.strftime("%m%d%y")
  end
end
