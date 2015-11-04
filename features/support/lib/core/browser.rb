module Stamps
  module Browser
    class Browser
      include Singleton

      def safari?
        "apple|osx|safari|mac".include? ENV['BROWSER'].downcase
      end


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

        #log "Field enabled? #{enabled}"
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

        #log "Field disabled? #{disabled}"
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
            #log_browser_get(args[0], text, args[1])
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
            field.send_keys text #log_browser_set(field, text, field_name)
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
            field.set text #log_browser_set(field, text, field_name)
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
              args[0].focus
            rescue
              #log "Unable to focus on browser field #{args[0]}"
            end

            args[0].click
            #var_name = get_varname :args[0],
            #log_browser_click args[0]

          when 2
            begin
              args[0].focus
            rescue
              #log "Unable to focus on browser field #{args[1]} #{args[0]}"
            end
            args[0].click
            #log_browser_click args[0], args[1]
          else
            raise "Wrong number of arguments."
        end
      end

      def wait_while_present *args
        case args.length
          when 1
            begin
              args[0].wait_while_present
              true
            rescue
              false
            end
          when 2
            begin
              args[0].wait_while_present args[1].to_i
            rescue
              false
            end
          else
            raise "Illegal number of arguments for BrowserHelper.wait_while_present"
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
            @browser = @field.browser
            @second_field = nil
          when 2
            @field = args[0]
            #log browser_helper.present? @field
            @second_field = args[1]
            #log browser_helper.present? @second_field
          else
            #do nothing.
        end
      end

      def data_error
        browser_helper.attribute_value @field, "data-errorqtip"
      end

      def scroll_into_view
        @browser.execute_script('arguments[0].scrollIntoView();', @field)
      end

      def safe_scroll_into_view
        begin
          scroll_into_view
        rescue
          #ignore
        end
      end

      def send_keys special_char
        browser_helper.send_keys @field, special_char
        self
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

      def wait_while_present
        browser_helper.wait_while_present @field
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

      def double_click
        browser_helper.double_click @field
      end

      def safe_double_click
        browser_helper.safe_double_click @field
      end

      def click_while_present
        20.times{
          safe_click
          break unless present?
        }
      end

    end

    class Checkbox < ClickableField
      def initialize checkbox_field, verify_field, attribute, checked_tester
        super checkbox_field
        @verify_field = verify_field
        @attribute = attribute
        @checked_tester = checked_tester
      end

      def check
        unless checked?
          5.times{
            click
            break if checked?
          }
        end
      end

      def uncheck
        if checked?
          5.times{
            click
            break unless checked?
          }
        end
      end

      def checked?
        begin
          attrib_val = browser_helper.attribute_value @verify_field, @attribute
          if attrib_val == "true" || attrib_val == "false"
            return attrib_val == "true"
          else
            checked = attrib_val.include? @checked_tester
            #log "Checkbox checked? #{checked}"
            checked
          end
        rescue
          false
        end
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
      def data_qtip_field data_qtip_field, attribute_value
        @data_qtip_field = data_qtip_field
        @attribute_value = attribute_value
        self
      end

      def data_error_qtip
        browser_helper.attribute_value @data_qtip_field, @attribute_value
      end

      def set text
        browser_helper.set @field, text
        self
      end

      def set_until text
        20.times{
          set text
          sleep 1
          from_textbox = browser_helper.text @field
          from_textbox == "" if from_textbox.nil?
          break if from_textbox.include? text
        }
      end
    end

    class Dropdown < BrowserObject
      def initialize browser, dd, html_tag_symbol, input
        super browser
        @drop_down = dd
        @html_tag_symbol = html_tag_symbol
        @input = input
      end

      def drop_down_caret
        Button.new @drop_down
      end

      def text_box
        Textbox.new @input
      end

      def select selection
        case selection
          when String
            5.times{
              selection_field = expose_selection_field selection
              browser_helper.safe_click selection_field
              input_text = text_box.text
              break if input_text.include? selection
            }
          else
            2.times {
              selection_field = expose_selection_field selection
              browser_helper.safe_click selection_field
            }
        end
      end

      def selection_field selection
        case selection
          when String
            # Selection passed is String object.
            case @html_tag_symbol
              when :li
                return @browser.li :text => selection
              else
                raise "Unsupported HTML drop-down selection tag #{@html_tag_symbol}"
            end
          else
            return selection
        end
      end

      def expose_selection_field selection
        @selection_field = selection_field selection
        5.times{
          browser_helper.safe_click @drop_down, "drop-down"
          #log "Selection is present? #{browser_helper.present? @selection_field}"
          return @selection_field if browser_helper.present? @selection_field
        }
      end

      def selection operation, selection
        case operation.downcase
          when :field
            return Label.new (expose_selection_field selection)
          when :tooltip
            selection_field = expose_selection_field selection
            tooltip = browser_helper.attribute_value selection_field, "data-qtip"
            #log "Field Selection Tooltip (data-qtip):  #{tooltip}"
            tooltip
          else
            #do nothing
        end
      end
    end

    class BrowserHelper
      include Singleton

      def style field, var_name
        begin
          style = field.style(var_name)
          #log "Field Style:  #{style}"
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

        #log "Field enabled? #{enabled}"
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

        #log "Field disabled? #{disabled}"
        disabled
      end

      def attribute_value field, attribute
          5.times{
            begin
              @attribute_field_value = field.attribute_value(attribute)
              return @attribute_field_value unless @attribute_field_value.length < 1
            rescue => e
              #log "Attribute: #{attribute}, Field:  #{field}. #{e}"
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
            #log_browser_get(args[0], text, args[1])
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
          rescue
            #ignore
          end
          begin
            field.send_keys text #log_browser_set(field, text, field_name)
          rescue
            #ignore
          end
          actual_value =  field_text(field)
          begin
            break if (actual_value.include? text) || (text.include? actual_value)
          rescue Exception => e
            #log e
          end
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
            field.set text #log_browser_set(field, text, field_name)
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

        begin
          text = field.text
          return text if text.size > 0
        rescue
          #ignore
        end

        begin
          value = field.value
          return value if value.size > 0
        rescue
          #ignore
        end

        begin
          value = field.attribute_value 'value'
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
              #log "Unable to focus on browser field #{args[0]}"
            end

            args[0].click
            #var_name = get_varname :args[0],
            #log_browser_click args[0]

          when 2
            begin
              args[0].focus
            rescue
              #log "Unable to focus on browser field #{args[1]} #{args[0]}"
            end
            args[0].click
            #log_browser_click args[0], args[1]
          else
            raise "Wrong number of arguments."
        end
      end

      def safe_double_click *args
        begin
          double_click *args
        rescue
          #ignore
        end
      end

      def double_click *args
        case args.length
          when 1
            begin
              args[0].focus
            rescue
              #log "Unable to focus on browser field #{args[0]}"
            end

            args[0].double_click
            #var_name = get_varname :args[0],
            #log_browser_click args[0]

          when 2
            begin
              args[0].focus
            rescue
              #log "Unable to focus on browser field #{args[1]} #{args[0]}"
            end
            args[0].double_click
            var_name = %w(args[0])
            #log_browser_click args[0], var_name
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