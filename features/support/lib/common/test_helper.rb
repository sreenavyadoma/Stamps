module Stamps
  class TestHelper
    include Singleton
    include DataMagic

    def remove_dollar_sign str
      strip str, '$', ''
    end

    def strip str, char_to_remove, substitute_char
      str.gsub(char_to_remove, substitute_char)
    end
  end
end