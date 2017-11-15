module Stamps
  module Browser

    class StampsField
      attr_reader :field, :browser
      alias_method :checkbox, :field
      alias_method :radio, :field
      alias_method :textbox, :field
      alias_method :input, :field

      def initialize(field)
        @field=field
        @browser=field.browser
      end

      def url
        browser.url
      end

      def flash
        field.flash
      end

      def disabled?
        begin
          return field.disabled?
        rescue
          #ignore
        end
        true
      end

      def present?
        begin
          return exist? && visible?
        rescue
          #ignore
        end
        false
      end

      def clickable?
        truthy? && present? && enabled?
      end

      def visible?
        begin
          return field.visible?
        rescue
          #ignore
        end
        false
      end

      def exist?
        begin
          return field.exist?
        rescue
          #ignore
        end
        false
      end

      def enabled?
        begin
          return field.enabled?
        rescue
          #ignore
        end
        false
      end

      def truthy?
        !field.nil? && exist?
      end

      def hover
        begin
          field.hover if present?
        rescue
          #ignore
        end
      end

      def wait_while_present(counter=2, duration=0.25)
        begin
          (counter.to_i).times do
            break unless present?
            sleep(duration)
          end
        rescue
          #ignore
        end
        self
      end

      def wait_until_present(counter=2, duration=0.25)
        begin
          (counter.to_i).times do
            break if present?
            sleep(duration)
          end
        rescue
          #ignore
        end
        self
      end

      def scroll_into_view
        begin
          browser.execute_script('arguments[0].scrollIntoView();', field)
        rescue
          # ignore
        end
        self
      end

      def text
        begin
          return field.text if truthy? && !field.text.nil? && field.text.size > 0
        rescue
          #ignore
        end

        begin
          return field.value if truthy? && !field.value.nil? && field.value.size > 0
        rescue
          #ignore
        end

        begin
          return attribute_value('value') if truthy? && !attribute_value('value').nil? && attribute_value('value').size > 0
        rescue
          #ignore
        end
        ''
      end

      def attribute_value(attribute)
        begin
          field.attribute_value(attribute)
        rescue
          #ignore
        end
        ''
      end

      def click
        begin
          field.click if clickable?
        rescue
          #ignore
        end
        self
      end

      def click_while_present(counter=2, duration=0.25)
        begin
          (counter.to_i).times do
            click
            sleep(duration)
            break unless clickable?
          end
        rescue
          #ignore
        end
        self
      end

      def double_click
        begin
          field.double_click if clickable?
        rescue
          #ignore
        end
        self
      end

      def blur_out(counter=1)
        begin
          (counter.to_i).times do
            flash
            double_click
            click
          end
        rescue
          #ignore
        end
        self
      end

      def set_attribute_value(attribute_name, value)
        browser.execute_script("return arguments[0].#{attribute_name}='#{value}'", field) if present?
      end

      def data_error
        attribute_value("data-errorqtip")
      end

      def style(property)
        field.style(property)
      end
    end

    class StampsInput < StampsField
      def checked?
        begin
          return input.checked?
        rescue
          #ignore
        end
        false
      end

      def send_keys(symbol, iteration=1)
        iteration.to_i.times do
          begin
            clear
            textbox.send_keys(symbol) if present?
            break if symbol.instance_of?(Symbol)||text==symbol
          rescue
            #ignore
          end
        end
        self
      end

      def placeholder
        begin
          input.placeholder
        rescue
          #ignore
        end
        ''
      end
    end

    class StampsTextbox < StampsInput
      def set(str, iteration=1)
        iteration.to_i.times do
          begin
            clear
            textbox.set(str) if present?
            break if text==str
            set_attribute_value("value", str)  if present?
            break if text==str
          rescue
            #ignore
          end
        end
        self
      end

      def append(txt)
        begin
          textbox.append(txt) if present?
        rescue
          #ignore
        end
        self
      end

      def clear
        begin
          textbox.clear if present?
        rescue
          #ignore
        end
        self
      end
    end

    class StampsWatirRadio < StampsField
      def set
        begin
          radio.set
        rescue
          #ignore
        end
        self
      end

      def set?
        begin
          return radio.set? if present?
        rescue
          #ignore
        end
        false
      end
    end

    class StampsWatirCheckbox < StampsField
      def check
        5.times do
          set
          break if checked?
        end
      end

      def uncheck
        10.times do
          clear
          break unless checked?
        end
      end

      def set
        begin
          checkbox.set if present?
        rescue
          #ignore
        end
      end

      def clear
        begin
          checkbox.clear if present?
        rescue
          #ignore
        end
      end

      def checked?
        begin
          return checkbox.checked?
        rescue
          #ignore
        end
        false
      end

      def set?
        begin
          return checkbox.set?
        rescue
          #ignore
        end
        false
      end
    end

    class StampsCheckbox
      attr_accessor :checkbox, :check_verify, :attribute, :attribute_value
      def initialize(checkbox, check_verify, attribute, attribute_value)
        @checkbox=StampsField.new(checkbox)
        @check_verify=check_verify
        @attribute=attribute
        @attribute_value=attribute_value
      end

      def present?
        checkbox.present?
      end

      def enabled?
        checkbox.enabled?
      end

      def visible?
        checkbox.visible?
      end

      def exist?
        checkbox.exist?
      end

      def checked?
        begin
          result=check_verify.attribute_value(attribute)
          return result=="true" if result=="true"||result=="false"
          return result.include?(attribute_value)
        rescue
          #ignore
        end
        false
      end

      def check
        20.times do
          break if checked?
          checkbox.click
        end
        checked?
      end

      def uncheck
        if checked?
          20.times do
            checkbox.click
            break unless checked?
          end
        end
        checked?
      end
    end

    class StampsRadio
      attr_accessor :radio, :check_verify, :attribute, :attribute_value
      def initialize(radio, check_verify, attribute, attribute_value)
        @radio=StampsField.new(radio)
        @check_verify=check_verify
        @attribute=attribute
        @attribute_value=attribute_value
      end

      def select
        20.times do
          break if selected?
          radio.click
        end
        expect(selected?).to be(true), "Unable to select radio button"
        self
      end

      def selected?
        begin
          return check_verify.attribute_value(attribute).include?(attribute_value)
        rescue
          #ignore
        end
        false
      end
    end

    class StampsOldDropDown #TODO-Rob refactor this to StampsGenericDropDown
      attr_accessor :browser, :dropdown, :textbox, :html_tag

      def initialize(dropdown, html_tag, textbox)
        @browser=dropdown.browser
        @dropdown=StampsField.new(dropdown)
        @html_tag=html_tag
        @textbox=StampsTextbox.new(textbox)
      end

      def expose_selection(selection)
        case html_tag
          when :li
            selection_field=browser.li(text: selection)
          else
            "Unsupported HTML drop-down selection tag #{html_tag}".should
        end

        5.times do
          dropdown.click
          return selection_field if selection_field.present?
        end
        expect(selection_field).to be_present, "Drop-down selection #{selection} is not in the list of values."
      end

      def select(selection)
        selection_field=StampsField.new(expose_selection(selection))
        case selection
          when String
            10.times do
              selection_field.click
              break if textbox.text.include?(selection)
            end

          else
            2.times do
              selection_field.click
            end
        end
      end


      def data_qtip(selection)
        StampsField.new(expose_selection(selection)).attribute_value("data-qtip")
      end
    end

    class StampsDropDownLovSubStr < StampsTextbox
      attr_accessor :list_of_values, :dropdown

      def initialize(textbox, dropdown, list_of_values)
        super(textbox)
        @dropdown=StampsField.new(dropdown)
        @list_of_values=list_of_values
      end

      def select(str)
        dropdown.click
        sleep(0.25)
        expect(list_of_values).not_to be_nil, "Error: Set list_of_values before calling select_from_lov."
        10.times do
          begin
            dropdown.click if list_of_values.size==0
            break unless list_of_values.size==0
          rescue
            #ignore
          end
        end
        20.times do
          begin
            list_of_values.each do |item_selection|
              selection=StampsField.new(item_selection)
              if !selection.nil? && selection.text.downcase.include?(str.downcase)
                sleep(0.05)
                selection.click
                return text if text.downcase.include?(str.downcase)
              end
            end
          rescue
            #do nothing
          end
        end
        expect(text.downcase).to include(str.downcase)
        nil
      end
    end

    class StampsDropdown < StampsTextbox
      attr_accessor :html_tag, :dropdown

      def initialize(textbox, dropdown, html_tag)
        super(textbox)
        @dropdown=StampsField.new(dropdown)
        @html_tag=html_tag
      end

      def select(str)
        dropdown.click
        expect(html_tag).not_to be_nil, "Error: Set html_tag before calling select."
        case html_tag
          when :span
            selection=StampsField.new(browser.span(text: str))
          when :li
            selection=StampsField.new(browser.li(text: str))
          when :div
            selection=StampsField.new(browser.div(text: str))
          else
            # do nothing
        end

        20.times do
          begin
            dropdown.click unless selection.present?
            selection.scroll_into_view
            selection.click
            break if text==str
          rescue
            # ignore
          end
        end
        expect(text).to eql(str)
        text
      end
    end

    class StampsNumberField
      attr_reader :browser, :textbox, :inc_btn, :dec_btn

      def initialize(textbox, inc_btn, dec_btn)
        @textbox=StampsTextbox.new(textbox)
        @inc_btn=StampsField.new(inc_btn)
        @dec_btn=StampsField.new(dec_btn)
        @browser=textbox.browser
      end

      def present?
        textbox.present?
      end

      def text
        textbox.text
      end

      def set(value)
        textbox.set(value)
      end

      def increment(value)
        current_value=textbox.text.to_i
        value.to_i.times do
          inc_btn.click
        end
        expect(current_value + value.to_i).to eql textbox.text.to_i
      end

      def selection(str)
        expect([:li, :div]).to include(@selection_type)
        case selection_type
          when :li
            browser.lis(text: str)
          when :div
            browser.divs(text: str)
          else
            # do nothing
        end
      end

      def decrement(value)
        current_value=textbox.text.to_i
        value.to_i.times do
          dec_btn.click
        end
        expect(current_value + value.to_i).to eql textbox.text.to_i
      end
    end

    class StampsCombobox
      attr_accessor :browser, :textbox, :dropdown, :selection_type

      def initialize(textboxes, dropdowns, selection_type, index)
        @index=index
        @textbox=StampsTextbox.new(textboxes[@index])
        @dropdown=StampsTextbox.new(dropdowns[@index])
        @selection_type=selection_type
        @browser=textbox.browser
      end

      def present?
        textbox.present?
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
        dropdown.click
        10.times do
          selection=StampsField.new(selection(str))
          begin
            break if (textbox.text).include?(str)
            dropdown.click unless selection.present?
            selection.click
          rescue
            #ignore
          end
        end
        expect(textbox.text).to eql(str)
        textbox.text
      end
    end

    # Modals
    class ModalParam
      attr_accessor :browser, :logger, :scenario_name, :web_app, :test_env, :health_check, :usr, :pw, :url, :print_media,
                    :developer, :debug, :browser, :firefox_profile, :printer, :browser_str, :hostname
    end

    # StampsModal - base class for modals containing StampsElements
    class StampsModal
      def initialize(param)
        cache[:param]=param
        cache[:helper]=StampsTestHelper.new(param.logger)
      end

      def browser
        cache[:param].browser
      end

      def param
        cache[:param]
      end

      def logger
        cache[:param].logger
      end

      def helper
        cache[:helper]
      end

      protected
      def cache
        @cache ||= {}
      end
    end
  end
end