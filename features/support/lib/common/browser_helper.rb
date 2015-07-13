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
          field.set log_browser_set(field, text, field_name)
        rescue
          #ignore
        end
        break if field.attribute_value('value').include? text
      end
    end

    def text *args
      case args.length
        when 1
          field = args[0]
          field_name = ""
        when 2
          field = args[0]
          field_name = args[1]
        else
          raise "Wrong number of arguments for BrowserHelper.text method."
      end
      begin
        field.focus
      rescue
        #ignore
      end
      field_text = field.text
      field_attribute_value = field.attribute_value('value')
       if field_text.size > 0
         text = field_text
       elsif  field_attribute_value.size > 0
         text = field_attribute_value
       else
         text = ""
       end
      log_browser_get(field, text, field_name)
      text
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

    def field_present?(field)
      begin
        field.present?
      rescue
        return false
      end
    end
  end
end

# todo refactor into PageHelper