module Stamps
  module Browser

    class TestParam
      attr_accessor :browser, :logger, :scenario_name, :web_app, :test_env, :health_check
    end

    class Modal
      attr_accessor :param, :browser, :logger, :element_helper

      def initialize(param)
        @param = param
        @browser = param.browser
        @logger = param.logger
        @element_helper = ElementHelper
      end
    end

    class BrowserElement
      attr_reader(:browser, :element_helper, :element, :error_qtip_element, :error_qtip_element_attribute)
      def initialize(*args)
        case args.length
          when 1
            @element = args[0]
          when 2 #use this when data error qtip is found in the element
            @element = args[0]
            @error_qtip_element_attribute = args[1]
          when 3 # use this when data error qtip is in a another element
            @element = args[0]
            @error_qtip_element = args[1]
            @error_qtip_element_attribute = args[2]
          else
            "Illegal number of arguments.  Unable to create element.".should eql ""
        end
        @browser = @element.browser
        @element_helper = ElementHelper
      end

      def url
        browser.url
      end

      def disabled?
        begin
          element.disabled?
        rescue
          true
        end
      end

      def exist?
        begin
          element.exist?
        rescue
          false
        end
      end

      def present?
        begin
          element.present?
        rescue
          false
        end
      end

      def visible?
        begin
          element.visible?
        rescue
          false
        end
      end

      def enabled?
        begin
          element.enabled?
        rescue
          false
        end
      end

      def hover
        begin
          element.hover
        rescue
          #ignore
        end
      end

      def clear
        begin
          element.clear
        rescue
          #ignore
        end
      end

      def data_error_qtip
        begin
          # if data qtip element was not set or is nil, try to get data error qtip from the element representing this textbox.
          if error_qtip_element.nil?
            return element.attribute_value (error_qtip_element_attribute.nil?)?"data-errorqtip":error_qtip_element_attribute
          else
            return error_qtip_element.attribute_value (error_qtip_element_attribute.nil?)?"data-errorqtip":error_qtip_element_attribute
          end
        rescue
          #if data error element does not exist, return an empty string
          return ""
        end
      end

      def data_error
        element.attribute_value "data-errorqtip"
      end

      def scroll_into_view
        element_helper.scroll_into_view browser, element
      end

      def safe_scroll_into_view
        begin
          scroll_into_view
        rescue
          #ignore
        end
      end

      def attribute_value(*args)
        case args.length
          when 1
            #fetch the attribute value of this element using specified name
            attribute_name = args[0]
            element.attribute_value attribute_name
          when 2
            attribute_name = args[0]
            value = args[1]
            element.attribute_value attribute_name, value
          else
            raise "Illegal number of arguments for attribute_value. Pass 1 argument to get the value of that element or pass 2 arguments to set the value of that element"
        end
      end

      def placeholder
        attribute_value "placeholder"
      end

      def style(property)
        element.style(property)
      end

      def wait_while_present(*args)
        if args.length==1
          element.wait_while_present(args[0].to_i)
        else
          element.wait_while_present
        end
        self
      end
      def wait_until_present(*args)
        begin
          if args.length==1
            element.wait_until_present(args[0].to_i)
          else
            element.wait_until_present
          end
        rescue Exception => e
          logger.error e.message
          logger.error e.backtrace.join("\n")
        end
        self
      end

      def safely_wait_until_present(*args)
        begin
          wait_until_present(*args)
        rescue
          #ignroe
        end
      end

      def click
        element_helper.safe_click(element)
      end

      def safe_click
        element_helper.safe_click(element)
      end

      def double_click
        element_helper.double_click(element)
      end

      def safe_double_click
        element_helper.safe_double_click(element)
      end

      def click_while_present
        element_helper.click_while_present(element)
      end

      def safe_send_keys(special_char)
        begin
          send_keys(special_char)
        rescue
          #ignore
        end
      end

      def send_keys(special_char)
        element_helper.send_keys(element, special_char)
      end

      def set_element
        element_helper.set_element(element)
      end

      def text
        txt = element_helper.text(element)
        val = element.attribute_value("value")
        if txt.nil? && val.nil?
          ""
        elsif txt.nil?
          val
        elsif val.nil?
          txt
        else
          (txt.size>0)?txt:val
        end
      end

      def safe_text
        begin
          text
        rescue
          ""
        end
      end
    end

    class SelectionElement < BrowserElement
      attr_accessor(:verify_element, :attribute, :verify_element_attrib)
      def initialize(element, verify_element, attribute, verify_element_attrib)
        super element
        @verify_element = verify_element
        @attribute = attribute
        @verify_element_attrib = verify_element_attrib
      end

      def select
        10.times{
          break if selected?
          click
        }
      end

      def selected?
        begin
          attribute_value_str = verify_element.attribute_value(attribute)
          return attribute_value_str == "true" if attribute_value_str == "true" || attribute_value_str == "false"
          return attribute_value_str.include?(verify_element_attrib)
        rescue
          false
        end
      end
    end

    class WatirCheckbox < BrowserElement
      def check
        10.times do
          element_helper.set(element)
          break if checked?
        end
      end

      def uncheck
        10.times do
          element_helper.clear(element)
          break unless checked?
        end
      end

      def checked?
        element_helper.checked?(element)
      end
    end

    class CheckboxElement < BrowserElement
      attr_accessor(:verify_element, :attribute, :attribute_value)
      def initialize(element, verify_element, attribute, attribute_value)
        super element
        @verify_element = verify_element
        @attribute = attribute
        @attribute_value = attribute_value
      end

      def check
        50.times{
          break if checked?
          safe_click
        }
      end

      def uncheck
        if checked?
          50.times{
            safe_click
            break unless checked?
          }
        end
      end

      def checked?
        begin
          actual_attribute_value = verify_element.attribute_value(attribute)
          if actual_attribute_value == "true" || actual_attribute_value == "false"
            return actual_attribute_value == "true"
          else
            actual_attribute_value.include?(attribute_value)
          end
        rescue
          false
        end
      end
    end

    class RadioElement < BrowserElement
      attr_accessor(:verify_element, :attribute, :attribute_value)
      def initialize(element, verify_element, attribute, attribute_value)
        super element
        @verify_element = verify_element
        @attribute = attribute
        @attribute_value = attribute_value
      end

      def select
        50.times{
          break if selected?
          safe_click
        }
        selected?.should be true
      end

      def selected?
        begin
          (verify_element.attribute_value attribute).include? attribute_value
        rescue
          false
        end
      end
    end

    class TextboxElement < BrowserElement
      def set(text)
        element_helper.set(element, text)
        self
      end

      def safe_set(text)
        begin
          set(text)
        rescue
          #ignore
        end
      end
    end

    class DropDownElement < BrowserElement
      attr_accessor :drop_down, :text_box, :html_tag
      def initialize(browser, drop_down, html_tag, text_box)
        super(browser)
        @drop_down = drop_down
        @html_tag = html_tag
        @text_box = text_box
      end

      def expose_selection(selection)
        case html_tag
          when :li
            selection_element = browser.li(text: selection)
          else
            "Unsupported HTML drop-down selection tag #{html_tag}".should
        end

        5.times{
          element_helper.safe_click drop_down
          return selection_element if selection_element.present?
        }
      end

      def select(selection)
        case selection
          when String
            5.times do
              selection_element = expose_selection(selection)
              element_helper.safe_click(selection_element)
              break if element_helper.text(text_box).include?(selection)
            end
          else
            2.times do
              selection_element = expose_selection(selection)
              element_helper.safe_click(selection_element)
            end
        end
      end

      def data_qtip(selection)
        selection_element = expose_selection(selection)
        selection_element.attribute_value "data-qtip"
      end
    end

    class ElementHelper
      class << self

        def scroll_into_view(browser, element)
          begin
            browser.execute_script('arguments[0].scrollIntoView();', element)
          rescue
            # ignore
          end
        end

        def text element
          begin
            text = element.text
            return text if text.size > 0
          rescue
            #ignore
          end

          begin
            value = element.value
            return value if value.size > 0
          rescue
            #ignore
          end

          begin
            value = element.attribute_value('value')
            return value if value.size > 0
          rescue
            #ignore
          end
          ""
        end

        def send_keys(*args)
          case args.length
            when 2
              element = args[0]
              text = args[1]
              element_name = ""
            when 3
              element = args[0]
              text = args[1]
              element_name = args[2]
            else
              "Wrong number of arguments for BrowserHelper.set_text method.".should eql ""
          end
          2.times do
            begin
              element.send_keys(text)
            rescue
              #ignore
            end
          end
        end

        def set(*args)
          case args.size
            when 1
              element = args[0]
              element.set
            when 2
              element = args[0]
              text = args[1]
              15.times do
                begin
                  element.focus
                  #element.clear

                  # set element text
                  element.set(text)
                  actual_value = text(element)
                  break if actual_value == text
                  break if actual_value == text

                  #set element attribute value
                  set_attribute_value(element, "value", text)
                  actual_value = text(element)
                  break if actual_value == text
                  break if actual_value == text
                rescue
                  #ignore
                end
              end
            else
              args.size.should be_between(1, 2).inclusive
          end
        end

        def safe_click(element)
          begin
            element.click
          rescue
            #ignore
          end
        end

        def click_while_present(element)
          30.times{
            safe_click element
            break unless element.present?
          }
        end

        def checked?(element)
          begin
            element.checked?
          rescue
            return false
          end
        end

        def visible?(element)
          begin
            element.visible?
          rescue
            return false
          end
        end

        def enabled?(element)
          begin
            element.enabled?
          rescue
            return false
          end
        end

        def disabled?(*args)
          case args.length
            when 1
              @disabled_element = args[0]
              @element_attribute = "class"
              @search_string = "disabled"
            when 3
              @disabled_element = args[0]
              @element_attribute = args[1]
              @search_string = args[2]
            else
              "Wrong number of arguments for enabled?".should eql ""
          end
          attribute_value = attribute_value(@disabled_element, @element_attribute)
          disabled = attribute_value.include?(@search_string)

          #logger.info "element disabled? #{disabled}"
          disabled
        end

        def safe_double_click(element)
          begin
            element.double_click
          rescue
            #ignore
          end
        end

        def set_attribute_value(element, attribute_name, value)
          script = "return arguments[0].#{attribute_name}='#{value}'"
          element.browser.execute_script(script, element)
        end
      end
    end
  end
end