module Stamps
  class BrowserHelper
    include Singleton

    def set_text *args
      case args.length
        when 2
          field = args[0]
          text = args[1]
          field_name = ""
        when 3
          field = args[0]
          text = args[1]
          field_name = args[2]
        else
          raise "Wrong number of arguments for BrowserHelper.set_text method."
      end

      10.times do
        begin
          field.focus
          field.clear
          field.set log_browser_set(field, text, field_name)
        rescue
          #ignore
        end
        break if field.attribute_value('value').include? text
      end
    end

    def attribute field, attribute
      value = ""
      begin
        5.times{
          value = field.attribute_value(attribute)
          break unless value.length < 1
        }
      rescue
        #ignroe
      end
      log_attribute_get field, attribute, value
      value
    end

    def field_text field
      begin
        field.focus
      rescue
        #ignore
      end
      text = field.text
      value = field.attribute_value('value')
      if text.nil?
        ""
      elsif text.size > 0
        text
      elsif value.length > 0
        value
      else
        ""
      end
    end

    def text *args
      case args.length
        when 1
          field_text(args[0])
        when 2
          text = field_text(args[0])
          log_browser_get(args[0], text, args[1])
        else
          raise "Wrong number of arguments for BrowserHelper.text method."
      end
    end

    def click *args
      case args.length
        when 1
          begin
            args[0].focus
          rescue
            #ignore
          end
          args[0].click
          log_browser_click args[0]
        when 2
          begin
            args[0].focus
          rescue
            #ignore
          end
          args[0].click
          log_browser_click args[0], args[1]
        else
          raise "Wrong number of arguments."
      end
    end

    def wait_until_present *args
      case args.length
        when 1
          begin
            args[0].wait_until_present
            true
          rescue
            false
          end
        when 2
          begin
            args[1].times{
              args[0].wait_until_present
              return true if present? args[0]
            }
          rescue
            false
          end
        else
          raise "Illegal number of arguments for BrowserHelper.wait_until_present"
      end
    end

    def present?(field)
      begin
        field.present?
      rescue
        return false
      end
    end
  end
end

# todo refactor into PageHelper