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

    class BrowserObject
      def initialize *args
        case args.length
          when 1
            @browser = args[0]
            @@test_name = ''
          when 2
            @browser = args[0]
            @@test_name = args[1]
          else
            stop_test "ILLEGAL NUMBER OF ARGUMENTS FOR BrowserObject"
        end
      end

      def log
        @logger ||= Stamps::Logger.new @@test_name
      end

      def browser_helper
        BrowserHelper.instance
      end

      def test_helper
        TestHelper.instance
      end

      def stop_test message
        log.fatal message
        log.fatal "Teardown: Begin tearing down test"
        Stamps::Test.teardown
        log.fatal "Teardown: Done!"
        raise message
      end
    end

    class StampsClickableField
      def initialize *args
        case args.length
          when 1
            @field = args[0]
          when 2 #use this when data error qtip is found in the field
            @field = args[0]
            @data_error_field_attribute = args[1]
          when 3 # use this when data error qtip is in a another field
            @field = args[0]
            @data_error_field = args[1]
            @data_error_field_attribute = args[2]
          else
            stop_test "Illegal number of arguments.  Unable to create field."
        end
        @browser = @field.browser
      end

      def disabled?
        browser_helper.disabled? @field
      end

      def visible?
        browser_helper.visible? @field
      end

      def exist?
        browser_helper.exist? @field
      end

      def present?
        browser_helper.present? @field
      end

      def enabled?
        browser_helper.enabled? @field
      end

      def hover
        browser_helper.hover @field
      end

      def data_error_qtip
        begin
          # if data qtip field was not set or is nil, try to get data error qtip from the field representing this textbox.
          if @data_error_field.nil?
            return browser_helper.attribute_value @field, (@data_error_field_attribute.nil?)?"data-errorqtip":@data_error_field_attribute
          else
            return browser_helper.attribute_value @data_error_field, (@data_error_field_attribute.nil?)?"data-errorqtip":@data_error_field_attribute
          end
        rescue
          #if data error field does not exist, return an empty string
          return ""
        end
      end

      def attribute_enabled?
        browser_helper.attribute_enabled? @field
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

      def placeholder
        attribute_value "placeholder"
      end

      def style property
        browser_helper.style property
      end

      def field
        @field
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

    class StampsSelection < StampsClickableField
      def initialize clickable_field, verify_field, attribute, verify_field_attrib
        super clickable_field
        @verify_field = verify_field
        @attribute = attribute
        @verify_field_attrib = verify_field_attrib
      end

      def select
        10.times{
          break if selected?
          click
        }
      end

      def selected?
        begin
          value = browser_helper.attribute_value @verify_field, @attribute
          if value == "true" || value == "false"
            return value == "true"
          else
            value.include? @verify_field_attrib
          end
        rescue
          false
        end
      end
    end

    class StampsCheckbox < StampsClickableField
      def initialize checkbox_field, verify_field, attribute_name, attribute_value
        super checkbox_field
        @verify_field = verify_field
        @attribute = attribute_name
        @verify_field_attrib = attribute_value
      end

      def check
        5.times{
          break if checked?
          safe_click
        }
      end

      def uncheck
        if checked?
          5.times{
            safe_click
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
            attrib_val.include? @verify_field_attrib
          end
        rescue
          false
        end
      end
    end

    class StampsLabel < StampsClickableField
      def text
        txt = browser_helper.text @field
        val = browser_helper.attribute_value @field, "value"
        (txt.size>0)?txt:val
      end
    end

    class StampsButton < StampsClickableField
    end

    class StampsLink < StampsLabel
      def url
        stop_test "url is not yet implemented"
      end
    end

    class StampsInput < StampsLabel
      def set text
        script = "return arguments[0].value = '#{text}'"
        browser = @field.browser
        browser.execute_script(script, @field)
      end

      def send_keys special_char
        browser_helper.send_keys @field, special_char
        self
      end

      def safe_send_keys special_char
        begin
          self.send_keys special_char
        rescue
          #ignore
        end
      end
    end

    class StampsTextbox < StampsInput

      def set text
        browser_helper.set @field, text
        self
      end

      def safe_set text
        begin
          self.set text
        rescue
          #ignore
        end
      end

      def set_until text
        10.times{
          safe_set text
          from_textbox = browser_helper.text @field
          from_textbox == "" if from_textbox.nil?
          break if from_textbox.include? text
        }
      end
    end

    class StampsDropdown < BrowserObject
      def initialize browser, dd, html_tag_symbol, input
        super browser
        @drop_down = dd
        @html_tag_symbol = html_tag_symbol
        @input = input
      end

      def drop_down_caret
        StampsButton.new @drop_down
      end

      def text_box
        StampsTextbox.new @input
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
                stop_test "Unsupported HTML drop-down selection tag #{@html_tag_symbol}"
            end
          else
            return selection
        end
      end

      def expose_selection_field selection
        @verify_field_attrib = selection_field selection
        5.times{
          browser_helper.safe_click @drop_down, "drop-down"
          #log.info "Selection is present? #{browser_helper.present? @selection_field}"
          return @verify_field_attrib if browser_helper.present? @verify_field_attrib
        }
      end

      def selection operation, selection
        case operation.downcase
          when :field
            return StampsLabel.new (expose_selection_field selection)
          when :tooltip
            selection_field = expose_selection_field selection
            tooltip = browser_helper.attribute_value selection_field, "data-qtip"
            #log.info "Field Selection Tooltip (data-qtip):  #{tooltip}"
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
          #log.info "Field Style:  #{style}"
          return style
        rescue
          #
        end
        nil
      end

      def attribute_enabled? *args
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
            stop_test "Wrong number of arguments for enabled?"
        end
        attribute_value = attribute_value field, field_attribute
        enabled = attribute_value.include? search_string

        #log.info "Field enabled? #{enabled}"
        enabled
      end

      def attribute_value field, attribute
          5.times{
            begin
              @attribute_field_value = field.attribute_value attribute
              return @attribute_field_value unless @attribute_field_value.length < 1
            rescue => e
              #log.info "Attribute: #{attribute}, Field:  #{field}. #{e}"
            #ignroe
            end
          }
        #log_attribute_get field, attribute, value
        @attribute_field_value
      end

      def drop_down browser, drop_down_button, selection_field_type, drop_down_input, selection
        dd = StampsDropdown.new browser, drop_down_button, selection_field_type, drop_down_input
        dd.select selection
      end

      def text *args
        case args.length
          when 1
            field_text args[0]
          when 2
            field_text args[0]
            #log.browser_field args[0], text, args[1]
          else
            stop_test "Wrong number of arguments for BrowserHelper.text method."
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
            stop_test "Wrong number of arguments for BrowserHelper.set_text method."
        end
        5.times do
          begin
            field.focus
            field.send_keys ""
          rescue
            #ignore
          end
          begin
            field.send_keys text
          rescue
            #ignore
          end
          actual_value =  field_text(field)
          begin
            break if (actual_value.include? text) || (text.include? actual_value)
          rescue Exception => e
            #log.info e
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
            stop_test "Wrong number of arguments for BrowserHelper.set_text method."
        end

        5.times do
          begin
            field.focus
            field.clear
            field.set text
            actual_value =  field_text(field)
            break if (actual_value.to_s.include? text) || (text.to_s.include? actual_value)
          rescue
            #ignore
          end
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
              #log.info "Unable to focus on browser field #{args[0]}"
            end

            args[0].click
            #var_name = get_varname :args[0],
            #log_browser_click args[0]

          when 2
            begin
              args[0].focus
            rescue
              #log.info "Unable to focus on browser field #{args[1]} #{args[0]}"
            end
            args[0].click
            #log_browser_click args[0], args[1]
          else
            stop_test "Wrong number of arguments."
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
              #log.info "Unable to focus on browser field #{args[0]}"
            end

            args[0].double_click
            #var_name = get_varname :args[0],
            #log_browser_click args[0]

          when 2
            begin
              args[0].focus
            rescue
              #log.info "Unable to focus on browser field #{args[1]} #{args[0]}"
            end
            args[0].double_click
            var_name = %w(args[0])
            #log_browser_click args[0], var_name
          else
            stop_test "Wrong number of arguments."
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
            stop_test "Illegal number of arguments for BrowserHelper.wait_until_present"
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
          else
            stop_test "Illegal number of arguments for BrowserHelper.wait_until_present"
        end
      end

      def present? field
        begin
          field.present?
        rescue
          return false
        end
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
            stop_test "Wrong number of arguments for enabled?"
        end
        attribute_value = attribute_value @disabled_field, @field_attribute
        disabled = attribute_value.include? @search_string

        #log.info "Field disabled? #{disabled}"
        disabled
      end

      def exist? field
        begin
          field.exist?
        rescue
          return false
        end
      end

      def visible? field
        begin
          field.visible?
        rescue
          return false
        end
      end

      def enabled? field
        begin
          field.enabled?
        rescue
          return false
        end
      end

      def hover field
        begin
          field.hover
        rescue
          #ignore
        end
      end
    end
  end
end
