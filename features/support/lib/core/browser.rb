module Stamps

  module Browser

    class StampsElement
      attr_reader :element, :browser
      def initialize(element)
        @element = element
        @browser = element.browser
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
        element.present?
      end

      def checked?
        begin
          element.checked?
        rescue
          return false
        end
      end

      def visible?
        begin
          element.visible?
        rescue
          return false
        end
      end

      def enabled?
        begin
          element.enabled?
        rescue
          return false
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

      def wait_while_present(*args)
        if args.length==1
          element.wait_while_present(args[0].to_i)
        else
          element.wait_while_present
        end
      end

      def wait_until_present(*args)
        begin
          if args.length==1
            element.wait_until_present(args[0].to_i)
          else
            element.wait_until_present
          end
        rescue
          #ignore
        end
      end

      def scroll_into_view
        begin
          browser.execute_script('arguments[0].scrollIntoView();', element)
        rescue
          # ignore
        end
      end

      def text
        begin
          return element.text if !element.text.nil? && element.text.size > 0
        rescue
          #ignore
        end

        begin
          return element.value if !element.value.nil? && element.value.size > 0
        rescue
          #ignore
        end

        begin
          return attribute_value('value') if !attribute_value('value').nil? && attribute_value('value').size > 0
        rescue
          return ""
        end
        ""
      end

      def attribute_value(attribute)
        begin
          element.attribute_value(attribute)
        rescue
          return ''
        end
      end

      def send_keys(key)
        2.times do
          begin
            element.send_keys(key)
          rescue
            #ignore
          end
        end
      end

      def click
        begin
          element.click
        rescue
          #ignore
        end
      end

      def click_while_present
        20.times do
          click
          sleep(0.05)
          break unless element.present?
        end
      end

      def double_click
        begin
          element.double_click
        rescue
          #ignore
        end
      end

      def blur_out(*args)
        count = 3 if args.length == 0
        count = args[0].to_i if args.length > 0
        count.to_i.times do
          click
          double_click
        end
      end
    end

    class StampsTextbox < StampsElement
      def present?
        element.present?
      end

      def set(txt)
        15.times do
          begin
            element.focus
          rescue
            #ignore
          end
          begin
            element.set(txt)
            break if text == txt
            set_attribute_value("value", txt)
            break if text == txt
          rescue
            #ignore
          end
        end
      end

      def set_attribute_value(attribute_name, value)
        browser.execute_script("return arguments[0].#{attribute_name}='#{value}'", element)
      end
    end

    class StampsTextboxHelpText < StampsTextbox
      attr_reader :help_element

      def initialize(element, help_element)
        super(element)
        @help_element = StampsElement.new((help_element.nil?)?element:help_element) #if help_element is nil, use element as help element
      end

      def help_text
        help_element.text
      end

      def data_error
        attribute_value("data-errorqtip")
      end

      def placeholder
        attribute_value("placeholder")
      end

      def style(property)
        element.style(property)
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

    class StampsCheckbox
      attr_accessor :clickable_element, :verify_element, :attribute, :attribute_value

      def initialize(clickable_element, verify_element, attribute, attribute_value)
        @clickable_element = StampsElement.new(clickable_element)
        @verify_element = StampsElement.new(verify_element)
        @attribute = attribute
        @attribute_value = attribute_value
      end

      def present?
        clickable_element.present?
      end

      def check
        50.times do
          break if checked?
          clickable_element.click
        end
      end

      def uncheck
        if checked?
          50.times do
            clickable_element.click
            break unless checked?
          end
        end
      end

      def checked?
        begin
          result = verify_element.attribute_value(attribute)
          return result == "true" if result == "true" || result == "false"
          result.include?(attribute_value)
        rescue
          false
        end
      end
    end

    class StampsRadio
      attr_accessor :element, :verify_element, :attribute, :attribute_value
      def initialize(element, verify_element, attribute, attribute_value)
        @element = StampsElement.new(element)
        @verify_element = StampsElement.new(verify_element)
        @attribute = attribute
        @attribute_value = attribute_value
      end

      def select
        50.times{
          break if selected?
          element.click
        }
        expect(selected?).to be(true)
      end

      def selected?
        begin
          verify_element.attribute_value(attribute).include?(attribute_value)
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

    class StampsNumberField
      attr_reader :text_box, :inc_btn, :dec_btn

      def initialize(textbox, inc_btn, dec_btn)
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

    class StampsComboBox
      attr_accessor :text_box, :drop_down, :selection_type

      def initialize(text_boxes, drop_downs, selection_type, index)
        @index = index
        @text_box = StampsTextbox.new(text_boxes[@index])
        @drop_down = StampsTextbox.new(drop_downs[@index])
        @selection_type = selection_type
        @browser = text_box.browser
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
        10.times do
          selection = StampsElement.new(selection(str))
          begin
            break if (text_box.text).include?(str)
            drop_down.click unless selection.present?
            selection.click
            logger.info "Selected: #{text_box.text} - #{((text_box.text).include? str)?"done": "not selected"}"
          rescue
            #ignore
          end
        end
        expect(text_box.text).to eql(str)
        text_box.text
      end
    end

    # Modals

    class ModalParam
      attr_accessor :browser, :logger, :scenario_name, :web_app, :test_env, :health_check, :usr, :pw, :url, :print_media, :developer
    end

    # StampsModal is a parent class for modals containing StampsElements
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

  end
end