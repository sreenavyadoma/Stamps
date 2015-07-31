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

    def date_from_today *args
      today = Date.today
      log "Today:  #{today}"
      case args.length
        when 0
          "#{today.month}/#{today.day}/#{today.year}"
        when 1
          new_date = today + args[0].to_i
          "#{new_date.month}/#{new_date.day}/#{new_date.year}"
        else
          raise "Illegal number of arguments for TestHelper.date_from_today"
      end
    end

  end
end