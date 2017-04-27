module Stamps
  module Browser
    module HelpBlockElement
      attr_accessor :help_elements
      def help_text(*args)
        expect(help_elements).not_to be_nil, "help_elements cannot be nil. Set Object.help_elements=some_element_collection before calling help_text."
        return "" if help_elements.size == 0 # there are no help elements, return an empty string
        index = (args.size=0)?0:(args[0].to_i-1)
        begin
          help_elements[index].text
        rescue Exception => e
          p e.message
          p e.backtrace.join("\n")
          return ""
        end
      end

      def has_error?
        expect(help_elements).not_to be_nil, "help_elements cannot be nil. Set Object.help_elements=some_element_collection before calling help_text."
        begin
          help_elements.size > 0
        rescue
          return false
        end
      end
    end

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

    class StampsTextBox < StampsElement
      include HelpBlockElement

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

        def clear
          element.clear
        end
      end

      def set_attribute_value(attribute_name, value)
        browser.execute_script("return arguments[0].#{attribute_name}='#{value}'", element)
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

    class WatirCheckBoxWrapper < StampsElement
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

    class StampsCheckBox
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

    class StampsOldDropDown #TODO-Rob refactor this to StampsGenericDropDown
      attr_accessor :browser, :drop_down, :text_box, :html_tag

      def initialize(drop_down, html_tag, text_box)
        @browser = drop_down.browser
        @drop_down = StampsElement.new(drop_down)
        @html_tag = html_tag
        @text_box = StampsTextBox.new(text_box)
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

    class StampsDropDown < StampsTextBox
      attr_reader :drop_down
      attr_accessor :html_tag, :list_of_values

      def initialize(text_box, drop_down)
        super(text_box)
        @drop_down = drop_down
        @html_tag = html_tag
      end

      def select_from_lov(str)
        drop_down.click
        sleep(0.25)
        expect(list_of_values).not_to be_nil, "Error: Set list_of_values before calling select_from_lov."
        10.times do
          drop_down.click if list_of_values.size == 0
          break unless list_of_values.size == 0
        end
        selection = nil
        10.times do
          list_of_values.each do |element|
            selection = StampsElement.new(element)
            return selection if !selection.nil? && selection.text.downcase.include?(str)
          end
        end
        nil
      end

      def select(str)
        drop_down.click
        expect(html_tag).not_to be_nil, "Error: Set html_tag before calling select."
        case html_tag
          when :span
            selection = StampsElement.new(browser.span(text: str))
          when :li
            selection = StampsElement.new(browser.li(text: str))
          when :div
            selection = StampsElement.new(browser.div(text: str))
          else
            # do nothing
        end
        select_element(str, selection)
      end

      def select_element(str, selection)
        20.times do
          drop_down.click unless selection.present?
          selection.click
          break if element.text.downcase.include?(str)
        end
        expect(element.text).to include(str), "Invalid selection: #{str}. Check your page object."

      end
    end

    class StampsNumberField
      attr_reader :text_box, :inc_btn, :dec_btn

      def initialize(textbox, inc_btn, dec_btn)
        @text_box = StampsTextBox.new(textbox)
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
      attr_accessor :browser, :text_box, :drop_down, :selection_type

      def initialize(text_boxes, drop_downs, selection_type, index)
        @index = index
        @text_box = StampsTextBox.new(text_boxes[@index])
        @drop_down = StampsTextBox.new(drop_downs[@index])
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
        drop_down.click
        10.times do
          selection = StampsElement.new(selection(str))
          begin
            break if (text_box.text).include?(str)
            drop_down.click unless selection.present?
            selection.click
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
      attr_accessor :browser, :logger, :scenario_name, :web_app, :test_env, :health_check, :usr, :pw, :url, :print_media, :developer, :debug, :browser_sym, :firefox_profile
    end

    # StampsModal is a parent class for modals containing StampsElements
    class StampsModal
      attr_accessor :param, :browser, :logger, :helper

      def initialize(param)
        @param = param
        @browser = param.browser
        @logger = param.logger
        @helper = StampsTestHelper.new(logger)
      end
    end
  end
end