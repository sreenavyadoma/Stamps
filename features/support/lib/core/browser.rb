module Stamps
  module Browser

    class TestParam
      attr_accessor :browser, :logger, :scenario_name, :web_app, :test_env, :health_check, :usr, :pw, :url, :print_form
    end

    class StampsHtmlField
      attr_accessor :param, :browser, :logger, :element_helper, :test_helper

      def initialize(param)
        @param = param
        @browser = param.browser
        @logger = param.logger
        @element_helper = ElementHelper
        @test_helper = TestHelper
      end
    end

    class StampsElement
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
            expect("Illegal number of arguments.  Unable to create element.").to eql ""
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

      def safe_send_keys(key)
        begin
          send_keys(key)
        rescue
          #ignore
        end
      end

      def send_keys(key)
        element_helper.send_keys(element, key)
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

    class StampsSelection < StampsElement
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

    class WatirCheckbox < StampsElement
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

    class StampsCheckbox < StampsElement
      attr_accessor(:verify_element, :attribute, :attribute_value)
      def initialize(element, verify_element, attribute, attribute_value)
        super(element)
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

    class StampsRadio < StampsElement
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
        expect(selected?).to be true
      end

      def selected?
        begin
          (verify_element.attribute_value attribute).include? attribute_value
        rescue
          false
        end
      end
    end

    class StampsTextbox < StampsElement
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

    class StampsDropDown < StampsElement
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

    class StampsNumberField < Browser::StampsHtmlField
      attr_reader :text_box, :inc_btn, :dec_btn, :name

      def initialize(param, textbox, inc_btn, dec_btn, name)
        super(param)
        @text_box = StampsTextbox.new(textbox)
        @inc_btn = StampsElement.new(inc_btn)
        @dec_btn = StampsElement.new(dec_btn)
        @name = name
      end

      def present?
        text_box.present?
      end

      def text
        text_box.text
      end

      def set(value)
        text_box.set(value)
        logger.info "#{@name} set to #{text_box.text}"
      end

      def increment(value)
        current_value = text_box.text.to_i
        value.to_i.times do
          inc_btn.safe_click
        end
        expect(current_value + value.to_i).to eql text_box.text.to_i
      end

      def decrement(value)
        current_value = text_box.text.to_i
        value.to_i.times do
          dec_btn.safe_click
        end
        expect(current_value + value.to_i).to eql text_box.text.to_i
      end
    end

    class StampsComboBox < Browser::StampsHtmlField
      attr_accessor :param, :text_box, :drop_down, :selection_type

      def initialize(param, text_boxes, drop_downs, selection_type, index)
        super(param)
        @index = index
        @text_box = StampsTextbox.new(text_boxes[@index])
        @drop_down = StampsTextbox.new(drop_downs[@index])
        @selection_type = selection_type
        @param = text_box.param
        @browser = param.browser
      end

      def selection(str)
        expect([:li, :div]).to include(@selection_type)
        case selection_type
          when :li
            browser.lis(text: str)[@index]
          when :div
            browser.divs(text: str)[@index]
          else
            # do nothing
        end
      end

      def select(str)
        logger.info "Select #{str}"
        10.times do
          begin
            break if (text_box.text).include?(str)
            drop_down.safe_click unless selection(str).present?
            element_helper.safe_click(selection(str))
            logger.info "Selected: #{text_box.text} - #{((text_box.text).include? str)?"done": "not selected"}"
          rescue
            #ignore
          end
        end
        expect(text_box.text).to eql(str)
        text_box.text
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

        def text(element)
          begin
            return element.text if element.text.size > 0
          rescue
            #ignore
          end

          begin
            return element.value if element.value.size > 0
          rescue
            #ignore
          end

          begin
            return element.attribute_value('value') if element.attribute_value('value').size > 0
          rescue
            #ignore
          end
          ''
        end

        def send_keys(element, key)
          2.times do
            begin
              element.send_keys(key)
            rescue
              #ignore
            end
          end
        end

        def set(*args)
          case args.size
            when 1
              args[0].set('')
            when 2
              element = args[0]
              text = args[1]
              15.times do
                begin
                  element.focus
                  element.set(text)
                  break if text(element) == text
                  set_attribute_value(element, "value", text)
                  break if text(element) == text
                rescue
                  #ignore
                end
              end
            else
              expect(args.size).to be_between(1, 2).inclusive
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
          30.times do
            safe_click element
            break unless element.present?
          end
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
              expect("Wrong number of arguments for enabled?").to eql ""
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

    class TestHelper
      class << self
        def first_half(str)
          index = (str.size.to_f / 2).ceil
          str[0, index]
        end
      end
    end

  end
end