module Stamps
  module Browser

    class TestParam
      attr_accessor :browser, :logger, :scenario_name, :web_app, :test_env, :health_check, :usr, :pw, :url, :print_media, :developer
    end

    class StampsElement
      include ElementHelper
      attr_reader :browser, :error_qtip_element, :error_qtip_element_attribute
      def initialize(element)
        self.element = element
        self.browser = element.browser
      end

      def blur_out(*args)
        count = 3 if args.length == 0
        count = args[0].to_i if args.length > 0
        count.to_i.times do
          click
          safe_double_click
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

    end

    class StampsTextbox < StampsElement
      def set(txt)
        15.times do
          begin
            self.element.focus
          rescue
            #ignore
          end
          begin
            self.element.set(txt)
            break if text == txt
            set_attribute_value("value", txt)
            break if text == txt
          rescue
            #ignore
          end
        end
      end

      def set_attribute_value(attribute_name, value)
        self.browser.execute_script("return arguments[0].#{attribute_name}='#{value}'", self.element)
      end
    end

    class WatirCheckbox < StampsElement
      def check
        10.times do
          click
          break if checked?
        end
      end

      def uncheck
        10.times do
          clear
          break unless checked?
        end
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
        50.times do
          break if checked?
          click
        end
      end

      def uncheck
        if checked?
          50.times do
            click
            break unless checked?
          end
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
          click
        }
        expect(selected?).to be(true)
      end

      def selected?
        begin
          (verify_element.attribute_value attribute).include? attribute_value
        rescue
          false
        end
      end
    end

    class StampsDropDown
      attr_accessor :browser, :drop_down, :text_box, :html_tag

      def initialize(drop_down, html_tag, text_box)
        @browser = drop_down.browser
        @drop_down = StampsElement.new(drop_down)
        @html_tag = html_tag
        @text_box = StampsTextbox.new(text_box)
      end

      def expose_selection(selection)
        case html_tag
          when :li
            selection_element = browser.li(text: selection)
          else
            "Unsupported HTML drop-down selection tag #{html_tag}".should
        end

        5.times{
          drop_down.click
          return selection_element if selection_element.present?
        }
      end

      def select(selection)
        selection_element = StampsElement.new(expose_selection(selection))
        case selection
          when String
            10.times do
              selection_element.click
              break if text_box.text.include?(selection)
            end

          else
            2.times do
              selection_element.click
            end
        end
      end


      def data_qtip(selection)
        StampsElement.new(expose_selection(selection)).attribute_value("data-qtip")
      end
    end

    # Modals

    class StampsModal
      include Stamps::StampsTestHelper
      attr_accessor :param, :browser, :logger, :test_helper

      def initialize(param)
        @param = param
        @browser = param.browser
        @logger = param.logger
        @test_helper = TestHelper
      end
    end

    class StampsNumberField < Browser::StampsModal
      attr_reader :text_box, :inc_btn, :dec_btn

      def initialize(param, textbox, inc_btn, dec_btn)
        super(param)
        @text_box = StampsTextbox.new(textbox)
        @inc_btn = StampsElement.new(inc_btn)
        @dec_btn = StampsElement.new(dec_btn)
      end

      def present?
        text_box.present?
      end

      def text
        text_box.text
      end

      def set(value)
        text_box.set(value)
      end

      def increment(value)
        current_value = text_box.text.to_i
        value.to_i.times do
          inc_btn.click
        end
        expect(current_value + value.to_i).to eql text_box.text.to_i
      end

      def decrement(value)
        current_value = text_box.text.to_i
        value.to_i.times do
          dec_btn.click
        end
        expect(current_value + value.to_i).to eql text_box.text.to_i
      end
    end

    class StampsComboBox < Browser::StampsModal
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

      def present?
        text_box.present?
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
        drop_down.click
        drop_down.click
        10.times do
          begin
            break if (text_box.text).include?(str)
            drop_down.click unless selection(str).present?
            super.click(selection(str))
            logger.info "Selected: #{text_box.text} - #{((text_box.text).include? str)?"done": "not selected"}"
          rescue
            #ignore
          end
        end
        expect(text_box.text).to eql(str)
        text_box.text
      end
    end


  end
end