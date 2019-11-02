require './lib/shift_generator'

class CipherEngine
  @@charset = ("a".."z").to_a << " "

  def self.charset
    @@charset
  end

  def self.encrypt
  end

  def self.decrypt
  end
end
