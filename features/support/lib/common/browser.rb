module Stamps
  module Browser
    class Browser
      include Singleton

      def chrome?
        "chrome|gc|google".include? ENV['BROWSER'].downcase
      end

      def explorer?
        "ie|explorer|internet explorer".include? ENV['BROWSER'].downcase
      end

      def firefox?
        "ff|firefox|mozilla".include? ENV['BROWSER'].downcase
      end
    end

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
        attribute_value = attribute_value field, field_attribute
        enabled = attribute_value.include? search_string

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
        attribute_value = attribute_value field, field_attribute
        disabled = attribute_value.include? search_string

        log "Field disabled? #{disabled}"
        disabled
      end

      def attribute_include? field, field_attribute, search_string
        browser_value = attribute_value field, field_attribute
        browser_value.include? search_string
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
            field_text args[0]
          when 2
            text = field_text(args[0])
            log_browser_get(args[0], text, args[1])
          else
            raise "Wrong number of arguments for BrowserHelper.text method."
        end
      end

      def text=(*args)
        set args
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

      def set *args
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
              args[0].wait_until_present args[1].to_i
            rescue
              false
            end
          else
            raise "Illegal number of arguments for BrowserHelper.wait_until_present"
        end
      end

      def present? field
        begin
          field.present?
        rescue
          return false
        end
      end
    end

    class BrowserObject
      def initialize(browser)
        @browser = browser
      end
      def browser_helper
        BrowserHelper.instance
      end

      def test_helper
        TestHelper.instance
      end
    end

    class ClickableField
      def initialize *args
        case args.length
          when 1
            @field = args[0]
            @second_field = nil
          when 2
            @field = args[0]
            log browser_helper.present? @field
            @second_field = args[1]
            log browser_helper.present? @second_field
          else
            #do nothing.
        end
      end

      def browser_helper
        BrowserHelper.instance
      end

      def attribute_value name
        browser_helper.attribute_value @field, name
      end

      def style property
        browser_helper.style property
      end

      def second_disabled?
        raise "enabled field not set." if @second_field.nil?
        browser_helper.disabled? @second_field
      end

      def second_enabled?
        raise "enabled field not set." if @second_field.nil?
        browser_helper.enabled? @second_field
      end

      def field
        @field
      end

      def present?
        browser_helper.present? @field
      end

      def wait_until_present
        browser_helper.wait_until_present @field
      end

      def click
        browser_helper.click @field
      end

      def safe_click
        browser_helper.safe_click @field
      end

      def click_while_present
        20.times{
          safe_click
          sleep 2
          break unless present?
        }
      end

    end

    class Checkbox < ClickableField
      def initialize checkbox_field, verify_field, attribute, attrib_value_check
        super checkbox_field
        @verify_field = verify_field
        @attribute = attribute
        @attrib_value_check = attrib_value_check
      end

      def check
        5.times{
          click
          break if checked?
        }
      end

      def uncheck
        5.times{
          click
          break unless checked?
        }
      end

      def checked?
        attrib_val = browser_helper.attribute_value @verify_field, @attribute
        checked = attrib_val.include? @attrib_value_check
        log "Checkbox checked? #{checked}"
        checked
      end
    end

    class Label < ClickableField
      def text
        browser_helper.text @field
      end

      def enabled?
        browser_helper.enabled? @field
      end

      def disabled?
        browser_helper.disabled? @field
      end

    end

    class Button < ClickableField

    end

    class Link < Label
      def url
        raise "url is not yet implemented"
      end
    end

    class Textbox < Label
      def set text
        browser_helper.set @field, text
        self
      end

      def send_keys special_char
        browser_helper.send_keys @field, special_char
        self
      end
    end

    class Dropdown < BrowserObject
      def initialize browser, drop_down_button, selection_field_type, drop_down_input
        super browser
        @drop_down = drop_down_button
        @selection_field_type = selection_field_type.downcase
        @input = drop_down_input
      end

      def drop_down_caret
        Button.new @drop_down
      end

      def text_box
        Textbox.new @input
      end

      def select selection
        3.times{
          expose_selection_field selection
          input_text = browser_helper.text @input
          break if input_text.include? selection
        }
      end

      def selection_field selection
        case selection
          when String
            case @selection_field_type
              when "li"
                return @browser.li :text => selection
              else
                raise "Unsupported HTML drop-down selection tag #{@selection_field_type}"
            end
          else
            return selection
        end
      end

      def expose_selection_field selection
        @selection_field = selection_field selection
        3.times{
          browser_helper.click @drop_down, "drop-down"
          log "Selection is present? #{browser_helper.present? @selection_field}"
          return @selection_field if browser_helper.present? @selection_field
        }
      end

      def selection operation, selection
        case operation.downcase
          when :field
            return Label.new (expose_selection_field selection)
          when :tooltip
            selection_field = expose_selection_field selection
            return browser_helper.attribute_value selection_field, "data-qtip"
          else

        end
      end
    end

    class BrowserHelper
      include Singleton

      def style field, var_name
        begin
          style = field.style(var_name)
          log "Field Style:  #{style}"
          return style
        rescue
          #
        end
        nil
      end

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
        attribute_value = attribute_value field, field_attribute
        enabled = attribute_value.include? search_string

        log "Field enabled? #{enabled}"
        enabled
      end

      def disabled? *args
        case args.length
          when 1
            @disabled_field = args[0]
            @field_attribute = "class"
            @search_string = "disabled"
          when 3
            @disabled_field = args[0]
            @field_attribute = args[1]
            @search_string = args[2]
          else
            raise "Wrong number of arguments for enabled?"
        end
        attribute_value = attribute_value @disabled_field, @field_attribute
        disabled = attribute_value.include? @search_string

        log "Field disabled? #{disabled}"
        disabled
      end

      def attribute_value field, attribute
          5.times{
            begin
              @attribute_field_value = field.attribute_value(attribute)
              return @attribute_field_value unless @attribute_field_value.length < 1
            rescue => e
              log "Attribute: #{attribute}, Field:  #{field}. #{e}"
            #ignroe
            end
          }
        #log_attribute_get field, attribute, value
        @attribute_field_value
      end

      def drop_down browser, drop_down_button, selection_field_type, drop_down_input, selection
        dd = Dropdown.new browser, drop_down_button, selection_field_type, drop_down_input
        dd.select selection
      end

      def text *args
        case args.length
          when 1
            field_text args[0]
          when 2
            text = field_text(args[0])
            log_browser_get(args[0], text, args[1])
          else
            raise "Wrong number of arguments for BrowserHelper.text method."
        end
      end

      def text=(*args)
        set args
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

      def set *args
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
        value = field.attribute_value 'value'
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
            log_browser_click args[0], args[1]
          else
            raise "Wrong number of arguments."
        end
      end

      def double_click *args
        case args.length
          when 1
            begin
              args[0].focus
            rescue
              log "Unable to focus on browser field #{args[0]}"
            end

            args[0].double_click
            #var_name = get_varname :args[0],
            log_browser_click args[0]

          when 2
            begin
              args[0].focus
            rescue
              log "Unable to focus on browser field #{args[1]} #{args[0]}"
            end
            args[0].double_click
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

      def present? field
        begin
          field.present?
        rescue
          return false
        end
      end
    end

  end
end