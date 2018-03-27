module Stamps
  ##
  #
  module WebApps
    Param = Struct.new(:driver, :log, :test_scenario, :sdc_app, :env, :health_check, :usr, :pw, :url, :print_media, :debug, :firefox_profile, :printer, :hostname) {} unless Object.const_defined?('Param')

    ##
    #
    class Base < Stamps::Core::Base
      attr_reader :param, :log
      def initialize(param)
        super(param.driver)
        @param = param
        @log = param.log
        self
      end

      def cache
        @cache = {} if @cache.nil?
        @cache
      end
    end
    
    class StampsField
      class << self
        attr_accessor :driver
      end

      attr_accessor :field, :verify_field, :ver_field_attr, :ver_field_attr_value
      def initialize(field)
        @field = field
        self.driver = field.browser unless field.driver.nil? # TODO-Rob encapsulate field.browser
      end
      alias_method :checkbox, :field
      alias_method :radio, :field
      alias_method :textbox, :field
      alias_method :input, :field

      def driver
        if self.class.driver.nil?
          raise ArgumentError, "driver is nil for html field #{field.class}. Set #{self.class.to_s.split('::').last}.driver = driver after creating this object."
        end
        self.class.driver
      end

      def driver=(driver)
        self.class.driver = driver
      end

      def url
        driver.url
      end

      def flash
        field.flash
      end

      def disabled?
        begin
          return field.disabled?
        rescue
          # ignore
        end
        true
      end

      def present?
        begin
          return exist? && visible?
        rescue
          # ignore
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
          # ignore
        end
        false
      end

      def exist?
        begin
          return field.exist?
        rescue
          # ignore
        end
        false
      end

      def enabled?
        begin
          return field.enabled?
        rescue
          # ignore
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
          # ignore
        end
      end

      def wait_while_present(counter = 2, duration = 0.25)
        begin
          counter.to_i.times do
            break unless present?
            sleep(duration)
          end
        rescue
          # ignore
        end
        self
      end

      def wait_until_present(counter = 2, duration = 0.25)
        begin
          counter.to_i.times do
            break if present?
            sleep(duration)
          end
        rescue
          # ignore
        end
        self
      end

      def scroll_into_view
        begin
          driver.execute_script('arguments[0].scrollIntoView();', field)
        rescue
          # ignore
        end
        self
      end

      def text
        begin
          return field.text if truthy? && !field.text.nil? && field.text.size > 0
        rescue
          # ignore
        end

        begin
          return field.value if truthy? && !field.value.nil? && field.value.size > 0
        rescue
          # ignore
        end

        begin
          return attribute_value('value') if truthy? && !attribute_value('value').nil? && attribute_value('value').size > 0
        rescue
          # ignore
        end
        ''
      end

      def attribute_value(attribute)
        begin
          return field.attribute_value(attribute)
        rescue
          # ignore
        end
        ''
      end

      def click(ctr = 1)
        begin
          ctr.to_i.times do
            field.click if clickable?
          end
        rescue
          # ignore
        end
        self
      end

      def click_while_present(counter = 2, duration = 0.25)
        begin
          counter.to_i.times do
            click
            sleep(duration)
            break unless clickable?
          end
        rescue
          # ignore
        end
        self
      end

      def double_click(ctr = 1)
        begin
          ctr.to_i.times do
            field.double_click if clickable?
          end
        rescue
          # ignore
        end
        self
      end

      def blur_out(ctr = 1)
        begin
          ctr.to_i.times do
            flash
            double_click
            click
          end
        rescue
          # ignore
        end
        self
      end

      def set_attribute_value(attribute_name, value)
        driver.execute_script("return arguments[0].#{attribute_name}='#{value}'", field) if present?
      end

      def data_error
        attribute_value('data-errorqtip')
      end

      def style(property)
        field.style(property)
      end
      def fire_event(event)
        field.fire_event(event)
      end

      def stamps_disabled?(attrib = nil, attrib_val = nil)
        verify_field.attribute_value(attrib.nil? ? ver_field_attr : attrib).include?(attrib_val.nil? ? ver_field_attr_value : attrib_val)
      end
    end

    class StampsInput < StampsField
      def checked?
        begin
          return input.checked?
        rescue
          # ignore
        end
        false
      end

      def send_keys(symbol, iteration = 1)
        iteration.to_i.times do
          begin
            clear
            textbox.send_keys(symbol) if present?
            break if symbol.instance_of?(Symbol) || text == symbol
          rescue
            # ignore
          end
        end
        self
      end

      def placeholder
        begin
          input.placeholder
        rescue
          # ignore
        end
        ''
      end
    end

    class StampsTextbox < StampsInput
      def set(str, iteration = 1)
        iteration.to_i.times do
          begin
            clear
            textbox.set(str) if present?
            break if text == str
            set_attribute_value('value', str) if present?
            break if text == str
          rescue
            # ignore
          end
        end
        self
      end

      def append(txt)
        begin
          textbox.append(txt) if present?
        rescue
          # ignore
        end
        self
      end

      def clear
        begin
          textbox.clear if present?
        rescue
          # ignore
        end
        self
      end
    end

    class StampsWatirRadio < StampsField
      def set
        begin
          radio.set
        rescue
          # ignore
        end
        self
      end

      def set?
        begin
          return radio.set? if present?
        rescue
          # ignore
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
          # ignore
        end
      end

      def clear
        begin
          checkbox.clear if present?
        rescue
          # ignore
        end
      end

      def checked?
        begin
          return checkbox.checked?
        rescue
          # ignore
        end
        false
      end

      def set?
        begin
          return checkbox.set?
        rescue
          # ignore
        end
        false
      end
    end

    class StampsCheckbox
      attr_accessor :checkbox, :check_verify, :attribute, :attribute_value
      def initialize(checkbox, check_verify, attribute, attribute_value)
        @checkbox = StampsField.new(checkbox)
        @check_verify = check_verify
        @attribute = attribute
        @attribute_value = attribute_value
      end

      def present?
        checkbox.present?
      end

      def enabled?
        raise 'Not Implemented'
      end

      def visible?
        checkbox.visible?
      end

      def exist?
        checkbox.exist?
      end

      ##
      # Stamps UI framework disables an html field by adding string disabled in the field's class attribute.
      def stamps_disabled?(attr = 'class', attr_val = 'disabled')
        check_verify.attribute_value(attr).include?(attr_val)
      end

      def checked?
        begin
          result = check_verify.attribute_value(attribute)
          if result == 'true' || result == 'false'
            return result == 'true'
          end
          return result.include?(attribute_value)
        rescue
          # ignore
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
        @radio = StampsField.new(radio)
        @check_verify = check_verify
        @attribute = attribute
        @attribute_value = attribute_value
      end

      def select
        20.times do
          break if selected?
          radio.click
        end
        expect(selected?).to be(true), 'Unable to select radio button'
        selected?
      end

      def selected?
        begin
          return check_verify.attribute_value(attribute).include?(attribute_value)
        rescue
          # ignore
        end
        false
      end
    end

    class StampsOldDropDown # TODO-Rob refactor this to StampsGenericDropDown
      attr_accessor :driver, :dropdown, :textbox, :html_tag

      def initialize(dropdown, html_tag, textbox)
        @driver = dropdown.driver
        @dropdown = StampsField.new(dropdown)
        @html_tag = html_tag
        @textbox = StampsTextbox.new(textbox)
      end

      def expose_selection(selection)
        selection_field = case html_tag
                            when :li
                              driver.li(text: selection)
                            else
                              raise ArgumentError, "Unsupported HTML drop-down selection tag #{html_tag}".should
                          end

        5.times do
          dropdown.click
          return selection_field if selection_field.present?
        end
        expect(selection_field).to be_present, "Drop-down selection #{selection} is not in the list of values."
      end

      def select(selection)
        selection_field = StampsField.new(expose_selection(selection))
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
        StampsField.new(expose_selection(selection)).attribute_value('data-qtip')
      end
    end

    class StampsDropDownLovSubStr < StampsTextbox
      attr_accessor :list_of_values, :dropdown

      def initialize(textbox, dropdown, list_of_values)
        super(textbox)
        @dropdown = StampsField.new(dropdown)
        @list_of_values = list_of_values
      end

      def select(str)
        dropdown.click
        sleep(0.25)
        expect(list_of_values).not_to be_nil, 'Error: Set list_of_values before calling select_from_lov.'
        10.times do
          begin
            dropdown.click if list_of_values.size == 0
            break unless list_of_values.size == 0
          rescue
            # ignore
          end
        end
        20.times do
          begin
            list_of_values.each do |item_selection|
              selection = StampsField.new(item_selection)
              if !selection.nil? && selection.text.downcase.include?(str.downcase)
                sleep(0.05)
                selection.click
                return text if text.downcase.include?(str.downcase)
              end
            end
          rescue
            # do nothing
          end
        end
        expect(text.downcase).to include(str.downcase)
        nil
      end
    end

    # todo-Rob REW
    class StampsDropdown < StampsTextbox
      attr_accessor :html_tag, :dropdown

      def initialize(textbox, dropdown, html_tag)
        super(textbox)
        @dropdown = StampsField.new(dropdown)
        @html_tag = html_tag
      end

      def select(str)
        dropdown.click
        expect(html_tag).not_to be_nil, 'Error: Set html_tag before calling select.'
        selection = case html_tag
                      when :span
                        StampsField.new(driver.span(text: str))
                      when :li
                        StampsField.new(driver.li(text: str))
                      when :div
                        StampsField.new(driver.div(text: str))
                      else
                        raise ArgumentError, "#{html_tag} is not not implemented."
                    end

        20.times do
          begin
            dropdown.click unless selection.present?
            selection.scroll_into_view
            selection.click
            break if text == str
          rescue
            # ignore
          end
        end
        expect(text).to eql(str)
        text
      end
    end

    class StampsNumberField
      attr_reader :driver, :textbox, :increment, :decrement

      def initialize(textbox, inc_btn, dec_btn)
        @textbox = StampsTextbox.new(textbox)
        @increment = StampsField.new(inc_btn)
        @decrement = StampsField.new(dec_btn)
        @driver = textbox.driver
      end

      def present?
        textbox.present?
      end

      def scroll_into_view(*args)
        textbox.scroll_into_view(*args)
      end

      def text
        textbox.text
      end

      def set(value)
        textbox.set(value)
      end
    end

    class StampsCombobox
      attr_accessor :driver, :textbox, :dropdown, :selection_type, :index

      def initialize(textboxes, dropdowns, selection_type, index)
        @index = index
        @textbox = StampsTextbox.new(textboxes[index])
        @dropdown = StampsTextbox.new(dropdowns[index])
        @selection_type = selection_type
        @driver = textbox.driver
      end

      def present?
        textbox.present?
      end

      def select(str)
        dropdown.click
        10.times do
          selection = StampsField.new(
            case selection_type
              when :li
                driver.lis(text: str)[index]
              when :div
                driver.divs(text: str)[index]
              else
                # do nothing
            end
          )
          begin
            break if textbox.text.include?(str)
            dropdown.click unless selection.present?
            selection.scroll_into_view.click
          rescue
            # ignore
          end
        end
        textbox.text
      end
    end

    ##
    #
    module Cache
      class << self
        def included(base)
          base.extend ClassMethods
        end

        module ClassMethods
          def assign(cache)
            @cache = cache
          end

          def cache
            raise(ArgumentError, "Cache not set for #{self.to_s.split('::').last}") if @cache.nil?
            @cache
          end
        end
      end
    end

  end

end