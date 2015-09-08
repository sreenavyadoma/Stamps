module Stamps
  class BrowserHelper
    include Singleton

    def enabled? *args
      case args.length
        when 1
          field = args[0]
          field_attribute = "class"
          search_string = "enabled"
        when 3
          field = args[0]
          field_attribute = args[1]
          search_string = args[2]
        else
          raise "Wrong number of arguments for enabled?"
      end
      enabled = attribute_value_inlude? field, field_attribute, search_string
      log "Field enabled? #{enabled}"
      enabled
    end

    def disabled? *args
      case args.length
        when 1
          field = args[0]
          field_attribute = "class"
          search_string = "disabled"
        when 3
          field = args[0]
          field_attribute = args[1]
          search_string = args[2]
        else
          raise "Wrong number of arguments for enabled?"
      end
      disabled = attribute_value_inlude? field, field_attribute, search_string
      log "Field disabled? #{disabled}"
      disabled
    end

    def attribute_value_inlude? field, field_attribute, search_string
      browser_value = attribute_value field, field_attribute
      browser_value.include? search_string
    end

    def attribute_value field, attribute
      value = ""
      begin
        5.times{
          value = field.attribute_value(attribute)
          break unless value.length < 1
        }
      rescue
        #ignroe
      end
      #log_attribute_get field, attribute, value
      value
    end

    def drop_down browser, drop_down_button, selection_field_type, drop_down_input, selection
      dd = Dropdown.new browser, drop_down_button, selection_field_type, drop_down_input
      dd.select selection
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

    def text=(*args)
      set_text args
    end

    def send_keys *args
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

      5.times do
        begin
          field.focus
          field.clear
          field.send_keys log_browser_set(field, text, field_name)
        rescue
          #ignore
        end
        actual_value =  field_text(field)
        break if (actual_value.include? text) || (text.include? actual_value)
      end
    end

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

      5.times do
        begin
          field.focus
          field.clear
          field.set log_browser_set(field, text, field_name)
        rescue
          #ignore
        end
        actual_value =  field_text(field)
        break if (actual_value.include? text) || (text.include? actual_value)
      end
    end

    def field_text field
      begin
        field.focus
      rescue
        #ignore
      end
      text = field.text
      value = field.attribute_value('value')
      begin
        return text if text.size > 0
      rescue
        #ignore
      end
      begin
        return value if value.size > 0
      rescue
        #ignore
      end
      ""
    end

    def get_varname symb, the_binding
      var_name  = symb.to_s
      var_value = eval(var_name, the_binding)
      puts "#{var_name} = #{var_value.inspect}"
    end

    def safe_click *args
      begin
        click *args
      rescue
        #ignore
      end
    end



    def click *args
      case args.length
        when 1
          begin
            args[0].focus
          rescue
            log "Unable to focus on browser field #{args[0]}"
          end

          args[0].click
          #var_name = get_varname :args[0],
          log_browser_click args[0]

        when 2
          begin
            args[0].focus
          rescue
            log "Unable to focus on browser field #{args[1]} #{args[0]}"
          end
          args[0].click
          var_name = %w(args[0])
          log_browser_click args[0], var_name
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
            args[0].wait_until_present args[1].to_i
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